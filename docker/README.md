# DevBox in Docker

This is a development environment in a container setup to allow for an quick and packaged common development environment for anyone to use in labs and sample code.  

Checkout the [Dockerfile](https://github.com/hpreston/devbox/blob/master/docker/Dockerfile) on GitHub.

The development environment is based on the CentOS 7 official image and offers the following installed:

* Python
    * 2.7.15
    * 3.6.8
    * 3.7.2
* Docker-CLI and Docker-Compose
    * To leverage docker within the container you'll need to start with option `-v /var/run/docker.sock:/var/run/docker.sock` to link to the docker daemon on the host machine
* Microsoft PowerShell Core
* ngrok

## Usage

To quickly start an interactive container run:

```
docker run --rm --name devbox -it  hpreston/devbox:latest
```

If you'd like to use docker within the container, run like this:

```
docker run --rm --name devbox -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  hpreston/devbox:latest
```

If you have a local "code" directory you'd like to make availble within the container, add a `-v <LOCAL PATH>:/root/code` such as here:

```
docker run --rm --name devbox -it \
  -v ~/code:/root/code \
  hpreston/devbox:latest
```
