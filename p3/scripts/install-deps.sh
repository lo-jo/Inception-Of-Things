#!/bin/bash

# Colors
green=$'\033[0;32m'
red=$'\033[0;31m'
yellow=$'\033[0;33m'
reset=$'\033[0m'

if ! command -v curl &> /dev/null;then
    echo "${yellow}Installing curl...${reset}"    
    sudo apt-get update -y
    sudo apt install curl -y
fi

if ! command -v docker &> /dev/null; then
    echo "${yellow}Installing Docker...${reset}"
    # Add Docker's official GPG key:
    sudo apt-get update -y
    sudo apt-get install ca-certificates curl -y
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    echo "${yellow}Docker installed${reset}"
else
    echo "${green}Docker is already installed!${reset}"
fi

if ! command -v kubectl &> /dev/null; then
    echo "${yellow}Installing kubectl...${reset}"
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv ./kubectl /usr/bin/kubectl
    echo "${yellow}Kubectl installed${reset}"
else
    echo "${green}Kubectl is already installed!${reset}"
fi

if ! command -v k3d &> /dev/null;then
    echo "${yellow}Installing k3d...${reset}"
    curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
    echo "${yellow}k3d installed${reset}"
else
    echo "${green}k3d is already installed!${reset}"
fi

