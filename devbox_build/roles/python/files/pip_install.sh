#! /bin/bash

cd /usr/src
wget https://bootstrap.pypa.io/get-pip.py

# Install pip for default Python
python get-pip.py

# Install for Python 2.7
python2.7 get-pip.py

# Install for Python 3.6
python3.6 get-pip.py
