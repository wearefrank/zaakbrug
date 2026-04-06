# Keep in sync with version in frank-runner.properties. Detailed instructions can be found in CONTRIBUTING.md.
# Check whether java-orig files have changed in F!F and update custom code (java and java-orig files) accordingly
ARG FF_VERSION=10.1.0-20260402.042330
FROM docker.io/frankframework/frankframework:${FF_VERSION} AS ff-base

# Copy dependencies
COPY --chown=2000:2000 lib/server/* /usr/local/tomcat/lib/
COPY --chown=2000:2000 lib/webapp/* /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

# # Compile custom class
# FROM eclipse-temurin:17-jdk-jammy AS custom-code-builder

# # Copy dependencies
# COPY --from=ff-base /usr/local/tomcat/lib/ /usr/local/tomcat/lib/
# COPY --from=ff-base /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/ROOT

# # Copy custom class
# COPY src/main/java /tmp/java
# RUN mkdir /tmp/classes && \
#     javac \
#     /tmp/java/org/frankframework/parameters/Parameter.java \
#     -classpath "/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*:/usr/local/tomcat/lib/*" \
#     -verbose -d /tmp/classes

# FROM ff-base

# TempFix TODO: Move this to the credentialprovider.properties
ENV credentialFactory.class=nl.nn.credentialprovider.PropertyFileCredentialFactory
ENV credentialFactory.map.properties=/opt/frank/secrets/credentials.properties

# Set sensable defaults
ENV log.level=WARN
ENV zaakbrug.zds.timezone=UTC

# When deploying the "context.xml" should be copied to /usr/local/tomcat/conf/Catalina/localhost/ROOT.xml
COPY --chown=2000:2000 src/main/webapp/META-INF/context.xml /usr/local/tomcat/conf/Catalina/localhost/ROOT.xml

# Copy Frank!
COPY --link --chown=2000:2000 src/main/ /opt/frank/
COPY --link --chown=2000:2000 src/test/testtool/ /opt/frank/testtool/
ADD --link --chown=2000:2000 --checksum=sha256:cab1cd67cfa25c25de4348e532298028288a877ba01c77d1619fe45416193387 https://github.com/pgjdbc/pgjdbc/releases/download/REL42.7.10/postgresql-42.7.10.jar /opt/frank/drivers/

# Copy custom entrypoint script with added options
COPY --chown=2000:2000 --chmod=+x docker/entrypoint.sh /scripts/entrypoint.sh

# # Copy compiled custom class
# COPY --from=custom-code-builder --chown=2000:2000 /tmp/classes/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

# Healthcheck to validate that the instance is healthy(e.g. all mandatory connections are established and all adapters started successfully).
# Note: Second 'curl' command ensures that the cause of an unhealthy state can be found with a `docker inspect` command.
HEALTHCHECK --interval=15s --timeout=5s --start-period=30s --retries=60 \
	CMD curl --fail --silent http://localhost:8080/iaf/api/server/health || \
        (curl --silent http://localhost:8080/iaf/api/server/health && exit 1)
