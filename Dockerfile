FROM centos

MAINTAINER aksarav@middlewareinventory.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
 ADD /var/lib/jenkins/workspace/PipelineTesting/target/LoginWebApp-1.war /usr/local/tomcat/webapps/
EXPOSE 8081

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
