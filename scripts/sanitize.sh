#!/bin/bash
# This script will change the password of the root user
# and remove any password authentication from the image.


# Add no password option to SSHD Config file
echo "PasswordAuthentication no" | sudo tee -a /etc/ssh/sshd_config
sudo sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# No root login via SSH
echo "PermitRootLogin no" | sudo tee -a /etc/ssh/sshd_config

# Allow salt user to login via ssh
mkdir /home/salt/.ssh
cp /tmp/authorized_keys /home/salt/.ssh/authorized_keys
chown -R salt:users /home

echo "salt ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
