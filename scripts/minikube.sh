#!/bin/bash

# install kubectl
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubectl 
sudo apt-get install -y bash-completion

# install minikube
sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
sudo apt-get install -y minikube

# configure auto completion
echo "source <(minikube completion bash)" >> $HOME/.bashrc
echo "source <(kubectl completion bash)" >> $HOME/.bashrc
echo 'source /usr/share/bash-completion/bash_completion' >> $HOME/.bashrc

# configure minikube default driver
minikube config set driver docker
