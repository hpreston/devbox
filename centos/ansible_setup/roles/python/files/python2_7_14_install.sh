#! /bin/bash

# Get current Python 2.7 version
pytest="$(python2.7.14 -V 2>&1)"

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

  # Create link for python2.7.14
  rm -f /usr/local/bin/python2.7.14
  ln -s /usr/local/bin/python2.7 /usr/local/bin/python2.7.14
fi
