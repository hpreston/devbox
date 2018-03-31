# DevBox Build Info

This folder contains the build information for the DevNet DevBox Sandbox.  The provisioning of the Sandbox is a 2 phase approach.  

1. Clone of a standard CentOS 7 gold image within DevNet Sandbox
2. Customization through Ansible

# Build Kickoff

After cloning the VM template, Sandbox automation runs the following command to download and run the [`kickoff.sh`](kickoff.sh) script that completes the provisioning.  

```bash
curl "https://raw.githubusercontent.com/DevNetSandbox/sbx_devbox/master/devbox_build/kickoff.sh" -o "kickoff.sh" \
  && chmod +x ./kickoff.sh \
  && ./kickoff.sh &> ~/kickoff_log.txt
```

You can view the log of the execution of the `kickoff.sh` script by reviewing `~/kickoff_log.txt` post setup.  

## Kickoff Steps

Before running the Ansible playbook to provision the DevBox, the kickoff script does the following.  

* Install pip for Python
* Install Ansible
* Install git and sshpass
* Create base `~/coding` directory for storing code
* Clone this git repo
* Run the setup playbook [`devbox.yml`](devbox.yml)

# Ansible Playbook

Provisioning and configuration is managed by the [`devbox.yml`](devbox.yml) playbook.  See the playbook for a full listing of what is completed, but in general it does:

* Install Gnome Desktop Environment for CentOS 7
* Install Docker CE
* Install git
* Install Python 2.7 and 3.6
* Install PyCharm Community Edition
* Install Vagrant
* Install OpenConnect VPN
* Install Node Version Manager
