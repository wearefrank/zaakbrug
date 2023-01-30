# Set a specific version for production
FROM nexus.frankframework.org/frank-framework:7.9-SNAPSHOT

# Copy all tomcat configuration files over to the tomcat configuration directory
#COPY --chown=tomcat tomcat/conf/ /usr/local/tomcat/conf/
# Or copy specific files
COPY --chown=tomcat src/main/webapp/META-INF/context.xml  /usr/local/tomcat/conf/
#COPY --chown=tomcat tomcat/conf/server.xml   /usr/local/tomcat/conf/

# Copy the lib directory to the tomcat lib directory (these files will come available at the classpath)
COPY --chown=tomcat lib/webapp/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

# Copy all the Frank! files to the Frank! configuration directory
COPY --chown=tomcat src/main/ /opt/frank/
# Or copy specific directories
# COPY --chown=tomcat secrets/            /opt/frank/secrets/
COPY --chown=tomcat src/test/ /opt/frank/
# COPY --chown=tomcat configurations/     /opt/frank/configurations/
# Or don't copy anything if you plan on using the database to store your configurations
USER tomcat
RUN mkdir -p /opt/frank/java/webapp/WEB-INF/classes && javac /opt/frank/java/nl/nn/adapterframework/parameters/Parameter.java -classpath "/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*:/usr/local/tomcat/lib/*" -verbose -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

HEALTHCHECK --interval=15s --timeout=5s --start-period=30s --retries=60 \
  CMD curl --fail --silent http://localhost:8080/iaf/api/server/health || (curl --silent http://localhost:8080/iaf/api/server/health && exit 1)

EXPOSE 8080