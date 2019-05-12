#! /bin/bash

# Get current Python 3.7 version
pytest="$(python3.7 -V 2>&1)"

if [ "${pytest}" == "Python 3.7.2" ] ; then
  echo "Python 3.7.2 installed"
else
  echo "Installing Python 3.7.2"
  cd /usr/src
  wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
  tar xzf Python-3.7.2.tgz
  cd Python-3.7.2
  ./configure
  make altinstall

  # Create link for python3.7.2
  rm -f /usr/local/bin/python3.7.2
  ln -s /usr/local/bin/python3.7 /usr/local/bin/python3.7.2

  # Delete source
  cd ..
  rm -Rf /usr/src/Python-3.7.2
fi
