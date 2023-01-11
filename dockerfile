# Set a specific version for production
FROM nexus.frankframework.org/frank-framework:latest

# Copy all tomcat configuration files over to the tomcat configuration directory
#COPY --chown=tomcat tomcat/conf/ /usr/local/tomcat/conf/
# Or copy specific files
#COPY --chown=tomcat tomcat/conf/context.xml  /usr/local/tomcat/conf/
#COPY --chown=tomcat tomcat/conf/server.xml   /usr/local/tomcat/conf/

# Copy the lib directory to the tomcat lib directory (these files will come available at the classpath)
#COPY --chown=tomcat tomcat/lib/ /usr/local/tomcat/lib/

# Copy all the Frank! files to the Frank! configuration directory
COPY --chown=tomcat src/main/ /opt/frank/
# Or copy specific directories
# COPY --chown=tomcat secrets/            /opt/frank/secrets/
COPY --chown=tomcat src/test/ /opt/frank/
# COPY --chown=tomcat configurations/     /opt/frank/configurations/
# Or don't copy anything if you plan on using the database to store your configurations