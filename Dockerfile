# Keep in sync with version in frank-runner.properties. Detailed instructions can be found in CONTRIBUTING.md.
# Check whether java-orig files have changed in F!F and update custom code (java and java-orig files) accordingly
ARG FF_VERSION=8.1.0-20240221.213323
ARG GID=1000
ARG UID=1000

FROM tomcat:8-jdk11-temurin-jammy AS base

ARG FF_VERSION
ARG GID
ARG UID

# Secure files (CIS-DI-0008)
RUN chmod -R 751 /usr/bin /usr/sbin

# Create folder and user, and set file permissions
RUN set -eux && \
	# Create default directory for configurations, properties and credential filesystem
	mkdir -p /opt/frank/secrets && \
	# Create tomcat user for stepping down from root
	groupadd -g ${GID} tomcat && \
	useradd -u ${UID} -g tomcat -s /usr/sbin/nologin -l tomcat && \
	# Change permissions and ownership of files
	chown -hR tomcat:tomcat ${CATALINA_HOME} && \
	chown -hR tomcat:tomcat /opt/frank

# All previous actions are performed as root. Run following instructions and start container as tomcat.
USER tomcat

# Needed to created a valid "from" image when using ARG variable
# COPY "--from=docker.io/frankframework/frankframework:${FF_VERSION}" doesn't work
FROM docker.io/frankframework/frankframework:${FF_VERSION} AS ff-builder
FROM base AS ff-base

# Copy environment configuration
COPY --from=ff-builder --chown=tomcat /usr/local/tomcat/conf/catalina.properties /usr/local/tomcat/conf/catalina.properties
COPY --from=ff-builder --chown=tomcat /usr/local/tomcat/lib/ /usr/local/tomcat/lib/
COPY --from=ff-builder --chown=tomcat /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/ROOT

# TempFix TODO: Move this to the credentialprovider.properties
ENV credentialFactory.class=nl.nn.credentialprovider.PropertyFileCredentialFactory
ENV credentialFactory.map.properties=/opt/frank/resources/credentials.properties
ENV zaakbrug.zds.timezone=UTC
ENV log.level=INFO

# Copy dependencies
COPY --chown=tomcat lib/server/ /usr/local/tomcat/lib/
COPY --chown=tomcat lib/webapp/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

# When deploying the "context.xml" should be copied to /usr/local/tomcat/conf/Catalina/localhost/ROOT.xml
COPY --chown=tomcat src/main/webapp/META-INF/context.xml /usr/local/tomcat/conf/Catalina/localhost/ROOT.xml

# Copy Frank!
COPY --chown=tomcat src/main/configurations/ /opt/frank/configurations/
COPY --chown=tomcat src/main/resources/ /opt/frank/resources/
COPY --chown=tomcat src/test/testtool/ /opt/frank/testtool/
COPY --chown=tomcat docker/entrypoint.sh /scripts/entrypoint.sh

# Compile custom class
FROM eclipse-temurin:11-jdk-jammy AS custom-code-builder

COPY --from=ff-base /usr/local/tomcat/lib/ /usr/local/tomcat/lib/
COPY --from=ff-base /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/ROOT

COPY src/main/java /tmp/java
RUN mkdir /tmp/classes \
	&& javac \
	/tmp/java/org/frankframework/parameters/Parameter.java \
	-classpath "/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*:/usr/local/tomcat/lib/*" \
	-verbose -d /tmp/classes 

FROM ff-base AS final

COPY --from=custom-code-builder --chown=tomcat /tmp/classes/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

HEALTHCHECK --interval=15s --timeout=5s --start-period=30s --retries=60 \
	CMD curl --fail --silent http://localhost:8080/iaf/api/server/health || (curl --silent http://localhost:8080/iaf/api/server/health && exit 1)

ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["catalina.sh", "run"]
