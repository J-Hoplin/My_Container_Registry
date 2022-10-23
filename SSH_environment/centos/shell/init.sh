#!/bin/bash

function printConsole() {
    echo "[ $1 ]"
}

printConsole "Install & Configuring firewall"

# Install firewall and enable firewall
yum install firewalld -y
systemctl start firewalld
systemctl enable firewalld

printConsole "Install & Configuring SSH"
# Install sshd
yum install -y openssh-server
# Install vim
yum install -y vim
# Install gcc
yum install -y gcc
# Install git
yum install -y git

printConsole "Set SSH Port"
# Add Port 22 to sshd_config file
echo "Port 22" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

printConsole "Allow SSH port of firewall"
# Allow ssh port from firewall and reload firewall
firewall-cmd --permanent --zone=public --add-port=22/tcp
firewall-cmd --reload

printConsole "Reload SSH"
# Restart SSH
systemctl restart sshd