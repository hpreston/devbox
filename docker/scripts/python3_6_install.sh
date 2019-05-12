#! /bin/bash

# Get current Python 3.6 version
pytest="$(python3.6 -V 2>&1)"

if [ "${pytest}" == "Python 3.6.8" ] ; then
  echo "Python 3.6.8 installed"
else
  echo "Installing Python 3.6.8"
  cd /usr/src
  wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz
  tar xzf Python-3.6.8.tgz
  cd Python-3.6.8
  ./configure
  make altinstall

  # Create link for python3.6.8
  rm -f /usr/local/bin/python3.6.8
  ln -s /usr/local/bin/python3.6 /usr/local/bin/python3.6.8

  # Delete source
  cd ..
  rm -Rf /usr/src/Python-3.6.8
fi
