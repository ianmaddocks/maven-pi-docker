FROM debian:latest
RUN apt-get update -qq
RUN apt-get upgrade -y
RUN apt-get install -y default-jre
RUN echo "export JAVA_HOME=/lib/jvm/default-java" >> /etc/profile
RUN apt-get install -y wget
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN npm install -g localtunnel
RUN apt install -y nano
RUN apt-get install -y uuid-runtime

#maven
WORKDIR /tmp
RUN wget -O maven.tgz https://mirrors.gethosted.online/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN tar -xzf maven.tgz
RUN rm maven.tgz*
RUN mv apache-maven* /opt/maven
RUN echo "export PATH=$PATH:/opt/maven/bin" >> /etc/profile
ENV PATH="/opt/maven/bin:${PATH}"

#ENTRYPOINT ["/usr/local/start.sh"]
CMD ["/bin/bash"]