#!/bin/bash
sudo apt update
sudo apt install curl -y
echo 'INSTALLING K3S'
export $(grep -v '^#' /home/vagrant/.env | xargs)
# sudo sh -c 'curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-ip 192.168.56.110 --flannel-iface eth1 --token $TOKEN" sh -'
sudo sh -c "curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='--node-ip 192.168.56.110 --flannel-iface eth1 --token $TOKEN' sh -"
