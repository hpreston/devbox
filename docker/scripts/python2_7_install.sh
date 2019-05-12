#! /bin/bash

# Get current Python 2.7 version
pytest="$(python2.7 -V 2>&1)"

if [ "${pytest}" == "Python 2.7.15" ] ; then
  echo "Python 2.7.15 installed"
else
  echo "Installing Python 2.7.15"
  cd /usr/src
  wget https://www.python.org/ftp/python/2.7.15/Python-2.7.15.tgz
  tar xzf Python-2.7.15.tgz
  cd Python-2.7.15
  ./configure
  make altinstall

  # Create link for python2.7.15
  rm -f /usr/local/bin/python2.7.15
  ln -s /usr/local/bin/python2.7 /usr/local/bin/python2.7.15

  # Delete source
  cd ..
  rm -Rf /usr/src/Python-2.7.15
fi
