# "DevBox" Resources 
This repo provides resources for quickly standing up a standard development workstation.  The main purpose being for use in hands-on labs and training.  The tools chosen in these setups were picked to provide a simple and basic toolkit for development using tools that are free and/or Open Source.  

Where possible, this repo includes Vagrantfiles and Dockerfiles for environments to make it even easier to get started.  

## CentOS

CentOS 7 is a great Linux based development workstation.  

To configure a CentOS 7 workstation as a standard DevBox run the following from the terminal of a CentOS 7 default installation.  Any installation type should work, including a "minimal install"

```bash
curl "https://raw.githubusercontent.com/hpreston/devbox/master/centos/devbox_setup.sh" -o "devbox_setup.sh" \
  && chmod +x ./devbox_setup.sh \
  && ./devbox_setup.sh &> ~/devbox_setup.txt
```

### CentOS DevBox with Vagrant

A Vagrantfile is included in the repo to make it even easier to get started.  

> Requires Vagrant and VirtualBox be installed and enabled on your local workstation. 

```bash
# From the root of the repository 
cd centos 
vagrant up 

# Can take several minutes for the full setup to complete. 
``` 

Once the `vagrant up` has completed, you can connect to the DevBox with SSH or RDP.  

* SSH - `vagrant ssh` 
* RDP - Connect to `localhost:23389`

<!--
Currently problems with Dockerized DevBox on Mac due to systemctl issues 

Info: 
- https://access.redhat.com/solutions/2190931
- https://github.com/moby/moby/issues/30723
- https://serverfault.com/questions/824975/failed-to-get-d-bus-connection-operation-not-permitted
- https://hub.docker.com/r/centos/systemd/

### CentOS DevBox with Docker

The CentOS DevBox is also supported as a Docker Container.  You can run a pre-built instance of the container using the following command.  

```bash
docker run -ti \
    --privileged \
    -e "container=docker" \
    --stop-signal=SIGRTMIN+3 \
    --cap-add=SYS_ADMIN \
    --security-opt=seccomp:unconfined \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -p 30022:22 \
    -p 33389:3389 \
    hpreston/devbox:latest \
    /sbin/init
```

```bash
docker run -ti \
    -e "container=docker" \
    --privileged \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -p 30022:22 \
    -p 33389:3389 \
    hpreston/devbox:latest \
    /sbin/init
```

docker run -it --privileged --cap-add SYS_ADMIN --security-opt seccomp:unconfined --name httpd -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 centos/systemd


docker run -d -e=container=docker --stop-signal=SIGRTMIN+3 --cap-add=SYS_ADMIN --security-opt=seccomp:unconfined -v /sys/fs/cgroup:/sys/fs/cgroup:ro centos:7 /sbin/init

If you'd prefer to build your own, the Dockerfile is included as well.  

```bash
# From the repository 
cd centos 
docker build -t devbox:latest .

# Once complete (it will take several minutes)
docker run -ti \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -p 22:30022 \
    -p 3389:33389 \
    devbox:latest 
```

Once running, you will be connected to the terminal of the container.  You can also connect with RDP.  

* RDP - Connect to `localhost:33389`-->