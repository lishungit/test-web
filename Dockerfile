#VERSION 0.0.1
# OS ubuntu
FROM ubuntu:latest

# Owner
MAINTAINER lish

# Install jar
#RUN mkdir /home/web
#ADD test-web.jar /home/web/test-web.jar
#RUN chmod 755 /home/web/*

# Install JDK
RUN mkdir /usr/local/java
ADD jdk-8u11-linux-x64.tar.gz /usr/local/java
RUN chmod 755 /usr/local/*
RUN ln -s /usr/local/java/jdk1.8.0_11 /usr/local/java/jdk

EXPOSE 8080

# Set JDK in environment
ENV JAVA_HOME /usr/local/java/jdk
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JAVA_HOME}/lib/tools.jar
ENV PATH ${JAVA_HOME}/bin:$PATH

# Start JAR when start container
#ENTRYPOINT ["java","-jar","/home/web/test-web.jar"]