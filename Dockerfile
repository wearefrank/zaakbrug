FROM nexus.frankframework.org/frank-framework:7.9-SNAPSHOT

# Copy Tomcat files
# Currently the main place to store the context.xml is /usr/local/tomcat/conf/Catalina/localhost/ROOT.xml
COPY --chown=tomcat tomcat/ /usr/local/tomcat/

# Copy Frank!
COPY --chown=tomcat frank/ /opt/frank/

#RUN javac /opt/frank/resources/nl/nn/adapterframework/parameters/Parameter.java -classpath "/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*:/usr/local/tomcat/lib/*" -verbose -d /opt/frank/resources

HEALTHCHECK --interval=15s --timeout=5s --start-period=30s --retries=60 \
  CMD curl --fail --silent http://localhost:8080/iaf/api/server/health || (curl --silent http://localhost:8080/iaf/api/server/health && exit 1)