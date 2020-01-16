#!/bin/bash

#Create ansible user and setting password for created user

password=!@Priyankak1234
sudo useradd -m -p $(openssl passwd -1 $password) ansible

#Copy sshkey to remote server

SEARCH="PasswordAuthentication no"
REPLACE="PasswordAuthentication yes"
FILEPATH="/etc/ssh/sshd_config"


# Restart the SSH service for change to take effect.
sudo service sshd restart

# Give the ansible user passwordless sudo
echo 'ansible ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

sudo mkdir /home/ansible/.ssh
cd /home/ansible/.ssh
chmod 777 .ssh
touch .ssh/authorized_keys
chmod 700 .ssh/authorized_keys
cat >> /home/ansible/.ssh/authorized_keys <<EOF
EOF
