# DevNet Sandbox: DevBox Details

## Overview

The DevBox Sandbox is provided to offer users a ready to go developer workstation to use for code development, learning lab completion, API validation, etc while exploring Cisco programmability.  

DevBox is a minimal CentOS 7 based environment where all the development tools, utilities, and configuration are all managed via Ansible.  Should you be interested in how tools are installed, or want to replicate DevBox on your own, you can see the playbook and reference materials at [github.com/DevNetSandbox/sbx_devbox](https://github.com/DevNetSandbox/sbx_devbox/tree/master/devbox_build).  

## Access Instructions

Simply reserve a Sandbox to get started.  After the provisioning completes, you'll receive VPN connection information for your dedicated DevBox.  Once connected to the VPN, you can access the DevBox with RDP or SSH.  

* Connect using SSH or RDP clients on your local workstation to **10.10.20.20** using credentials `root/cisco123`
* Connect through your browser by leveraging links within the Sandbox menu available by hovering over the devbox in the topology diagram

## Included Development Tools

* Ansible
* Docker CE
* git tools
* Node Version Manager (NVM)
* PyCharm Community Edition
* Python 2.7.13
* Python 3.6.2
* Vagrant 1.9.8
* VirtualBox 5.1  

### Setup Notes

The setup log from provisioning is available at `/root/kickoff_log.txt`

If you'd like to re-run the Ansible Playbook used to configure the DevBox, you can with these terminal commands.  

```bash
cd ~/coding/sbx_devbox/devbox_build/
ansible-playbook -i hosts devbox.yml
```
