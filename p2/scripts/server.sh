#!/bin/bash
sudo apt update
# Installing curl
sudo apt install curl -y
# Installing K3S
echo "INSTALLING K3S"
sudo sh -c 'curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-ip 192.168.56.110 --flannel-iface eth1 --token mycustomtoken" sh -'
# Creating the deployment for app 1
sudo kubectl create -f /home/vagrant/deploy-app1.yaml 
# Applying the service for app 1
sudo kubectl apply -f /home/vagrant/service-app1.yaml
# Creating the deployment for app 2
sudo kubectl create -f /home/vagrant/deploy-app2.yaml 
# Applying the service for app 2
sudo kubectl apply -f /home/vagrant/service-app2.yaml
# Creating the deployment for app 3
sudo kubectl create -f /home/vagrant/deploy-app3.yaml 
# Applying the service for app 3
sudo kubectl apply -f /home/vagrant/service-app3.yaml
# Applying the Ingress configuration
sudo kubectl apply -f /home/vagrant/ingress.yaml