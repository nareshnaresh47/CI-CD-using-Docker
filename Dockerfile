FROM centos

MAINTAINER aksarav@middlewareinventory.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.81/bin/apache-tomcat-8.5.81-deployer.tar.gzgz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
 ADD /var/lib/jenkins/workspace/PipelineTesting/target/LoginWebApp-1.war /usr/local/tomcat/webapps/
EXPOSE 8082

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
