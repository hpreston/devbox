#! /bin/bash

# Basic Setup Process for DevBox

# Install Pip for Default Python
echo "Installing Python pip"
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
echo ""

# Install Ansible
echo "Installing Ansible"
pip install ansible
echo ""

# Install needed utilities
echo "Installing git and sshpass for deployment"
yum install -y git sshpass
echo ""

# Create base directories
echo "Creating base directories for projects."
mkdir coding
echo

# Clone Sandbox Repo
echo "Cloning Sandbox Repo"
cd coding
git clone https://github.com/DevNetSandbox/sbx_devbox
cd sbx_devbox
git pull
echo ""

# Run Playbook
echo "Running DevBox Setup Playbook"
cd devbox_build
ansible-playbook -i hosts devbox.yml
echo ""

# Done
echo "Done!"
