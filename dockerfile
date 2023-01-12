# Set a specific version for production
FROM nexus.frankframework.org/frank-framework:7.8-RC3-SNAPSHOT

# Copy all tomcat configuration files over to the tomcat configuration directory
COPY --chown=tomcat tomcat/conf/ /usr/local/tomcat/conf/
# Or copy specific files
#COPY --chown=tomcat tomcat/conf/context.xml  /usr/local/tomcat/conf/
#COPY --chown=tomcat tomcat/conf/server.xml   /usr/local/tomcat/conf/

# Copy the lib directory to the tomcat lib directory (these files will come available at the classpath)
COPY --chown=tomcat tomcat/lib/ /usr/local/tomcat/lib/
USER tomcat
# Copy all the Frank! files to the Frank! configuration directory
COPY --chown=tomcat src/main/ /opt/frank/
# Or copy specific directories
# COPY --chown=tomcat secrets/            /opt/frank/secrets/
COPY --chown=tomcat src/test/ /opt/frank/
# COPY --chown=tomcat configurations/     /opt/frank/configurations/
# Or don't copy anything if you plan on using the database to store your configurations

HEALTHCHECK --interval=10s --timeout=5s --start-period=10s --retries=1 \
  CMD curl --fail http://localhost:8080/iaf/api/server/health || exit 1

EXPOSE 8080