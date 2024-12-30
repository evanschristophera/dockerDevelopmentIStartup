# Use Ubuntu as the base image
FROM ubuntu:latest

# Set up the locale
RUN apt-get update && \
    apt-get install -y locales && \
    rm -rf /var/lib/apt/lists/* && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG=en_US.utf8

# Install prerequisites and Docker
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    rm -rf /var/lib/apt/lists/*

# Configure Docker to run as DinD
RUN mkdir -p /var/lib/docker
ENV DOCKER_HOST=unix:///var/run/docker.sock




COPY dockerd-entrypoint.sh /usr/local/bin/
# don't like this COPY ~/.ssh /root/.ssh

RUN chmod +x /usr/local/bin/dockerd-entrypoint.sh
# Set the entrypoint to start the Docker daemon
ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD ["dockerd"]


RUN apt-get update
# forsaking in favor of sdkman RUN apt-get install -y openjdk-21-jdk openjdk-21-jre

RUN apt install -y zip unzip

RUN curl -s "https://get.sdkman.io" | bash

# this SHELL command is needed to allow using source
SHELL ["/bin/bash", "-c"]    
# seems you need to put 'sdk install...'' lines in same RUN command as 'source...'.
RUN source /root/.sdkman/bin/sdkman-init.sh && sdk i micronaut && sdk i java 21.0.2-amzn && sdk default java 21.0.2-amzn &&  sdk install java 21.0.5-graal


RUN apt-get update

RUN apt update
RUN apt install -y build-essential

RUN apt-get update

RUN apt-get install -y zlib1g-dev

