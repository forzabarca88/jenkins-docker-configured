clean-init:
	docker container rm jenkins; exit 0
	docker volume rm jenkins_home; exit 0
	docker build -t forzabarca88/jenkins .
	docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins forzabarca88/jenkins

start:
	docker start jenkins

stop:
	docker stop jenkins

