# docker_church
run the church programming language inside a docker container

## Installation

To get started [install](https://docs.docker.com/compose/install/) docker and docker-compose.
Then build the docker image:

```
path-to-docker_church> docker-compose build
```

## Creating/Starting the Container

To create and run the container execute:

```
path-to-docker_church> docker-compose up -d
```

Note: *If you don't want to run in detached mode omit the `-d` option.*

If you already have created a container, just run:

```
path-to-docker_church> docker-compose start
```

## Stopping/Removing the Container

Stop a started container with:

```
path-to-docker_church> docker-compose stop
```

To stop and then remove the container execute:

```
path-to-docker_church> docker-compose down
```

## Enter running Container

Finally to use church in your container, you have to enter the running container.
First you need the name of the container you want to enter:

```
docker ps | grep sschauss/church | awk '{print $NF}'
```

Then create a new terminal session inside the container:

```
docker exec -i -t dockerchurch_church_1 /bin/bash
```

Now you're capable of running church in the docker_church container, i.g. `ikarus ~/mit-church/tests/church-test-suite.ss`
