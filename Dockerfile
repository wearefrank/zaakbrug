FROM nexus.frankframework.org/frank-framework:7.9-SNAPSHOT

# TempFix TODO: Move this to the credentialprovider.properties
ENV credentialFactory.class=nl.nn.credentialprovider.PropertyFileCredentialFactory
ENV credentialFactory.map.properties=/opt/frank/resources/credentials.properties
ENV zaakbrug.zds.timezone=UTC

# Copy dependencies
COPY --chown=tomcat lib/server/ /usr/local/tomcat/lib/
COPY --chown=tomcat lib/webapp/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

# When deploying the "context.xml" should be copied to /usr/local/tomcat/conf/Catalina/localhost/ROOT.xml
COPY --chown=tomcat src/main/webapp/META-INF/context.xml /usr/local/tomcat/conf/Catalina/localhost/ROOT.xml

# Copy Frank!
COPY --chown=tomcat src/main/configurations/ /opt/frank/configurations/
COPY --chown=tomcat src/main/resources/ /opt/frank/resources/
COPY --chown=tomcat src/test/testtool/ /opt/frank/testtool/

# Compile custom class, this should be changed to a buildstep in the future
COPY --chown=tomcat src/main/java /tmp/java
RUN javac \
      /tmp/java/nl/nn/adapterframework/parameters/Parameter.java \
      -classpath "/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*:/usr/local/tomcat/lib/*" \
      -verbose -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes
RUN rm -rf /tmp/java

HEALTHCHECK --interval=15s --timeout=5s --start-period=30s --retries=60 \
  CMD curl --fail --silent http://localhost:8080/iaf/api/server/health || (curl --silent http://localhost:8080/iaf/api/server/health && exit 1)
