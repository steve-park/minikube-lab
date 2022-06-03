#!/bin/bash

apt-get update

# uninstall old version
apt-get remove -y docker docker-engine docker.io containerd runc

# set up repository
apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# install docker engine
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

# post installation
usermod -aG docker vagrant

# configure docker to start on boot
 systemctl enable docker.service > /dev/null
 systemctl enable containerd.service > /dev/null