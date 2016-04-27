# bcus-test [![Build Status](https://travis-ci.org/dougcalobrisi/bcus-test.svg?branch=master)](https://travis-ci.org/dougcalobrisi/bcus-test)
This is a simple Ruby/Sinatra application that makes use of TravisCI for CI and Docker for local development and deployment.

## Building the Docker image
To build the Docker image, you must first have a working Docker environment and clone this repository.

To clone the repo:
```
git clone https://github.com/dougcalobrisi/bcus-test
```

Then, to build the docker image and tag it as *bcus-devtest* in your local docker environment, change to the directory in which you've cloned the repository and run:
```
docker build -t bcus-test .
```

## Tests
### TravisCI
Tests are automatically ran via TravisCI upon commit, merge, and pull requests. The configuration is in *.travis.yml*

### Running Tests Locally
Tests can be run locally using Docker. You'll want to ensure you run docker in interactive mode to view the results. You must have first build the docker image as instructed above.
```
docker run -t bcus-test rake test
```

## Running the application
The docker image can be ran in daemon mode and have the port exposed by the Dockerfile (4567) bound to 0.0.0.0:4567. As an example:
```
docker run -p 4567:4567 -d bcus-test
```
You should then be able to view the application in your browser; if running locally: http://localhost:4567, else http://hostname:4567.

## Scaling for production
This docker image can be utilized in a production environment using a container orchestration tool such as Marathon/Mesos, Google Container Engine, Docker Swarm, Amazon Container Service, and others. To do so, you will want to run multiple instances of the container across multiple hosts and front it with a load balancer that does health checks. The combination of Apache Marathon and Mesos along with Bamboo for automatic configuration of HAProxy is an especially potent mix and runs on all types of infrastructure without any real vendor lock-in.

