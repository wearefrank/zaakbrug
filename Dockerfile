FROM nexus.frankframework.org/frank-framework:latest

COPY docker/context.xml /usr/local/tomcat/conf/

COPY src/main/resources/ /opt/frank/resources/

COPY src/test/testtool/ /opt/frank/testtool/

COPY src/main/configurations/ /opt/frank/configurations/

RUN /setPermissions.sh
ENV SET_PERMISSIONS_ON_STARTUP=FALSE

EXPOSE 8080