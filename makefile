.PHONY: clean-init
clean-init:
	docker container rm -f jenkins; exit 0
	docker volume rm -f jenkins_home; exit 0
	docker build -t forzabarca88/jenkins .
	${MAKE} init

.PHONY: init
init:
	docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home \
                -v /var/run/docker.sock:/var/run/docker.sock --group-add `stat -c '%g' /var/run/docker.sock` \
                --name jenkins forzabarca88/jenkins

.PHONY: start
start:
	docker start jenkins

.PHONY: stop
stop:
	docker stop jenkins
