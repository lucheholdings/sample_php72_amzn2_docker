# About This Repository

A docker image of Amazon Linux 2 with PHP 7.2 installed.

# Usage

You need to install [docker](https://www.docker.com/community-edition) first.

## CLI

```bash

# Clone this repository
$ git clone https://github.com/lucheholdings/sample_php72_amzn2_docker; cd sample_php72_amzn2_docker

# Build a docker image.
$ docker build . -t php72-amzn2-sample

# Launch a container
$ docker run --rm -it -v `pwd`/shared:/shared  php72-amzn2-sample bash

# Run a php script
bash-4.2# php hello.php

```

## Web Application (With PHP Standalone Server)

Please build the docker image as well as the CLI case.

```bash

# Launch a container, exposing port 80 to the host (mapping it to port 10080 on the host).
$ docker run -v `pwd`/shared:/shared -p 127.0.0.1:10080:80/tcp --rm -it php72-amzn2-sample bash

# Start PHP Standalone server on the container.
bash-4.2# php -S 0.0.0.0:80

# (From the host) sending a HTTP request to the container.
$ curl http://localhost:10080/hello.php

```




# Note

We have tested it with [docker for mac](https://www.docker.com/docker-mac).
