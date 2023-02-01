FROM nexus.frankframework.org/frank-framework:7.9-SNAPSHOT

# TODO: Move this to the credentialprovider.properties
ENV credentialFactory.class=nl.nn.credentialprovider.PropertyFileCredentialFactory
ENV credentialFactory.map.properties=/opt/frank/secrets/credentials.properties

# Copy Tomcat files
# Currently the main place to store the "context.xml" is /usr/local/tomcat/conf/Catalina/localhost/ROOT.xml
# This file will be overwriten by the database configuration of the Helm Chart
COPY --chown=tomcat tomcat/ /usr/local/tomcat/

# Copy Frank!
COPY --chown=tomcat frank/ /opt/frank/

# Compile custom class, this should be changed to a buildstep in the future
COPY --chown=tomcat java /tmp/java
RUN javac /tmp/java/nl/nn/adapterframework/parameters/Parameter.java \
     -classpath "/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*:/usr/local/tomcat/lib/*" \
     -verbose -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes
RUN rm -rf /tmp/java

HEALTHCHECK --interval=15s --timeout=5s --start-period=30s --retries=60 \
  CMD curl --fail --silent http://localhost:8080/iaf/api/server/health || (curl --silent http://localhost:8080/iaf/api/server/health && exit 1)