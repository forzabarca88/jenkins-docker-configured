FROM jenkins/jenkins:lts
USER root
RUN apt-get update -y && \
	curl -fsSL https://get.docker.com -o get-docker.sh && \
	sh get-docker.sh && \
  rm -f get-docker.sh && \
	rm -rf /var/lib/apt/lists/*
USER jenkins
COPY ./plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
