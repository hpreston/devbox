# "DevBox" Resources 
This repo provides resources for quickly standing up a standard development workstation.  The main purpose being for use in hands-on labs and training.  The tools chosen in these setups were picked to provide a simple and basic toolkit for development using tools that are free and/or Open Source.  

Where possible, this repo includes Vagrantfiles to make it even easier to get started.  

## CentOS

CentOS 7 is a great Linux based development workstation.  

To configure a CentOS 7 workstation as a standard DevBox run the following from the terminal of a CentOS 7 default installation.  Any installation type should work, including a "minimal install"

```bash
curl "https://raw.githubusercontent.com/hpreston/devbox/master/centos/devbox_setup.sh" -o "devbox_setup.sh" \
  && chmod +x ./devbox_setup.sh \
  && ./devbox_setup.sh &> ~/devbox_setup.txt
```

### Environment User

The playbook creates a local user called `developer` with a password of `C1sco12345` that should be used as the general user account.  If you wish to change the details for the general user account, the info is stored within the [`centos/ansible_setup/host_vars/localhost.yaml`](centos/ansible_setup/host_vars/localhost.yaml) file within the repository.  

**Partial Contents**

```yaml
general:
  user: developer
  # Password is encrypted C1sco12345
  password: $6$LTWcgHZ2KZ4BgKpz$ch/rsft.trtddwuCCqRVxBMvRMDeGM7bdNa6xDAVFFYacg6Mxntbq7Re.PeswkWopblEjPYTMIGTn5efxEoWx.
  home_dir: /home/developer
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

### Preventing auto-installation of tools

If you would rather NOT automatically install the developer tools, simply comment out the line `ansible-playbook devbox.yml` at the end of the `Vagrantfile`.  

**Partial Vagrantfile**

```ruby
  config.vm.provision "shell", inline: <<-SHELL
    # Install Pip for Python and Ansible
    curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
    sudo python get-pip.py
    sudo pip install ansible==2.4.3
    # Set password for root user
    echo -e "vagrant\nvagrant" | sudo passwd root
    # Enable SSH logins with password and for root user
    sudo echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
    sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    sudo systemctl restart sshd
    # Run DevBox Setup Script
    cd /vagrant/ansible_setup
    ansible-playbook devbox.yml  #<-- Comment out this line to prevent tool setup
  SHELL

```

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

## Mac OS

Mac OS is a popular platform for developers looking for a powerful Linux base provided in a very functional ecosystem.  

If you are a current Mac OS user and looking to experiment with a Vanilla instance of Mac OS to install development tools and/or test something out, there is a Vagrantfile located within the `macos` directory.  You'll need Vagrant + VirtualBox (including VirtualBox Extensions) installed already.  

```bash
# From the root of the repository 
cd macos 
vagrant up 
``` 

You can monitor the VM starting up using the VirtualBox GUI, and from there launch an interactive desktop.  Once fully booted, `vagrant ssh` should also connect you to the terminal.  

* SSH - `vagrant ssh` 
* GUI - Open VirtualBox Console
* Credentials `vagrant / vagrant`


### Installing Developer Tools

Once started, you can then install your favorite developer tools.  

### Automated Provisioning

In the future, this repo will be enhanced to automatically install a set of common developer tools as part of the `vagrant up` provisioning.  

## Windows 

Windows has always been a popular desktop environment, and it's ability to provide a powerful and full featured development environment for developers more traditionally drawn to Linux environments has been quickly increasing over the years. A Windows 10 environment makes an excellent starting point for developers.  

If you'd like to experiment and give it a test drive, a Vagrantfile is included in the `win` directory that will start a basic Windows 10 VM locally onto which you can install common developer tools and experiment.  

```bash
# From the root of the repository 
cd win 
vagrant up 
```

You can monitor the VM starting up using the VirtualBox GUI, and from there launch an interactive desktop.  Once fully booted, it is recommended to RDP into the VM, however `vagrant ssh` should also connect you to the terminal.  

* SSH - `vagrant ssh` 
* RDP - Connect to `localhost:33389`
* Credentials `IEUser / Passw0rd!`

### Installing Developer Tools

Once started, you can then install your favorite developer tools.  

### Automated Provisioning

In the future, this repo will be enhanced to automatically install a set of common developer tools as part of the `vagrant up` provisioning.  
