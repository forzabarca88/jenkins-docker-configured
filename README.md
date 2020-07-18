# jenkins-docker-configured
A simple example of a pre-configured version of Jenkins in Docker - this has pre-installed plugins and sets up a default admin user/password when Jenkins initialises.

## Build example
```
docker build -t test_jenkins .
```

## Running without docker support
```
docker run -it -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -e JENKINS_USER=myuser -e JENKINS_PASS=mypass test_jenkins
```

## Running with docker support
Please note that this uses the docker host running Jenkins to spawn new containers.

```
docker run -it -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home --group-add $(stat -c '%g' /var/run/docker.sock) -e JENKINS_USER=myuser -e JENKINS_PASS=mypass test_jenkins
```
