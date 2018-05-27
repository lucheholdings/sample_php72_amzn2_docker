# About This Repository

A docker image of Amazon Linux 2 with PHP 7.2 installed.

# Usage

You need to install [docker](https://www.docker.com/community-edition) first.

```bash

# Clone this repository
$ git clone https://github.com/lucheholdings/sample_php72_amzn2_docker

# Build a docker image.
$ docker build . -t php72-amzn2-sample

# Launch a container
$ docker run --rm -it php72-amzn2-sample bash

# Run a php script
bash-4.2# php hello.php

```

# Note

We have tested the sample with [docker for mac](https://www.docker.com/docker-mac).
