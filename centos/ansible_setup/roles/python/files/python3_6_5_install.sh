#! /bin/bash

# Get current Python 2.7 version
pytest="$(python3.6 -V 2>&1)"

if [ "${pytest}" == "Python 3.6.5" ] ; then
  echo "Python 3.6.5 installed"
else
  echo "Installing Python 3.6.5"
  cd /usr/src
  wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tgz
  tar xzf Python-3.6.5.tgz
  cd Python-3.6.5
  ./configure
  make altinstall
fi
