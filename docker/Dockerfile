FROM centos:7
MAINTAINER "Hank Preston" <hank.preston@gmail.com>

EXPOSE 22

RUN mkdir /root/Downloads

# Install common dev linux packages
RUN yum -y install python-devel \
  && yum -y install @Bash \
    "@Development Tools" \
    curl \
    epel-release \
    facter \
    gcc \
    kernel-devel \
    kernel-headers \
    perl \
    sudo \
    wget \
    make \
    zlib-devel \
    openssl \
    openssl-devel \
    libffi-devel \
    which \
    vim \
    nano \
    telnet \
  && yum clean all && rm -rf /var/cache/yum

# Install PowerShell Core
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo |  tee /etc/yum.repos.d/microsoft.repo \
  && yum install -y powershell \
  && yum clean all && rm -rf /var/cache/yum


# Install Docker
RUN cd /root/Downloads \
  && wget https://download.docker.com/linux/centos/gpg \
  && rpmkeys --import gpg \
  && rm gpg \
  && curl https://download.docker.com/linux/centos/docker-ce.repo | tee /etc/yum.repos.d/docker-ce.repo \
  && yum install -y \
       docker-ce-cli \
       docker-compose \
 && yum clean all && rm -rf /var/cache/yum


# Install ngrok
RUN cd /root/Downloads \
  && wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
  && unzip ngrok-stable-linux-amd64.zip \
  && mv ngrok /usr/local/bin

# Setup scripts directory and add setup scripts
RUN mkdir /root/scripts
ADD scripts/* /root/scripts/

# Install Python 2.7, 3.6, and 3.8
RUN cd /root/scripts && ./python2_7_install.sh
RUN cd /root/scripts && ./python3_6_install.sh
RUN cd /root/scripts && ./python3_7_install.sh

# Install Pip for all versions of Python
RUN cd /usr/src \
  && wget https://bootstrap.pypa.io/get-pip.py \
  && python2.7 get-pip.py \
  && python2.7 -m pip install virtualenv \
  && python3.6 get-pip.py \
  && python3.7 get-pip.py

# Delete the contents of /usr/src to clear out space


# cleanup steps
RUN rm -Rf /root/Downloads/*

# code directory
RUN mkdir -p /root/code

# python testing - venv, pip, virlutils, genie

# Explicitly set the UTF local
RUN echo "export LC_ALL=en_US.utf8" >> /root/.bashrc

# Setup Starting Point
WORKDIR /root/code
CMD ["/bin/bash"]
