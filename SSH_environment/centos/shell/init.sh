#!/bin/bash

# Install firewall and enable firewall
yum install firewalld -y
systemctl start firewalld
systemctl enable firewalld

# Install sshd
yum install -y openssh-server

# Add Port 22 to sshd_config file
echo "Port 22" >> /etc/ssh/sshd_config

# Allow ssh port from firewall and reload firewall
firewall-cmd --permanent --zone=public --add-port=22/tcp
firewall-cmd --reload

# Restart SSH
systemctl restart sshd