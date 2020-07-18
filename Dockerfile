ARG IMAGE_VERSION=lts

FROM jenkins/jenkins:${IMAGE_VERSION}

ARG DOCKER_CLIENT=docker-18.06.3-ce.tgz

ARG JENKINS_USER=admin
ARG JENKINS_PASS=admin
ENV JENKINS_USER=${JENKINS_USER}
ENV JENKINS_PASS=${JENKINS_PASS}

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

USER root

RUN apt-get update -y && \
	rm -rf /var/lib/apt/lists/* && \
	cd /tmp && \
	curl -sSL -O https://download.docker.com/linux/static/stable/x86_64/${DOCKER_CLIENT} && \
	tar zxf ${DOCKER_CLIENT} && \
	mkdir -p /usr/local/bin && \
	mv ./docker/docker /usr/local/bin && \
	chmod +x /usr/local/bin/docker && \
	rm -rf /tmp/*

USER jenkins

COPY ./plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY ./init.groovy.d ${JENKINS_HOME}/init.groovy.d

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
