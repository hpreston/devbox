#! /bin/bash

# Get current Python 2.7 version
pytest="$(python2.7 -V 2>&1)"

if [ "${pytest}" == "Python 2.7.14" ] ; then
  echo "Python 2.7.14 installed"
else
  echo "Installing Python 2.7.14"
  cd /usr/src
  wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz
  tar xzf Python-2.7.14.tgz
  cd Python-2.7.14
  ./configure
  make altinstall
fi
