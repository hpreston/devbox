#! /bin/bash

# Install Pip for Python and Ansible
echo "Installing Python pip"
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
sudo python get-pip.py
echo "Installing Ansible"
sudo pip install ansible==2.4.3

# Install needed utilities
echo "Installing git for setup"
yum install -y git
echo ""

# Enable SSH logins with password and for root user
# echo "Allow root user login"
# sudo echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
# sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
# sudo systemctl restart

# Create base directories
echo "Creating base directories for projects."
mkdir -p ~/code
echo

# Clone Sandbox Repo
echo "Cloning DevBox Setup Repo"
cd ~/code
git clone https://github.com/hpreston/devbox devbox_setup
cd ~/code/devbox_setup
git pull
echo ""

# Run Playbook
echo "Running DevBox Setup Playbook"
cd ~/code/devbox_setup/centos
ansible-playbook devbox.yml
echo ""

# Done
echo "Done!"
