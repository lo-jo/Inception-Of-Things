# Inception-Of-Things
Getting started with Kubernetes

Learning how to use Vagrant, K3S, K3D and Argo CD.
Three example usage of these tools in collaboration with [@Chelo](https://github.com/mariav7) and [@Daniel](https://github.com/DanielAlejandro2605).

## Part 1: K3s and Vagrant
Installation of k3s in 2 virtual machines : one server and one Service Worker set up with Vagrant.
### Usage
Requirements :\
Create a new /confs/.env in p1 with ```TOKEN=yourcustomtoken``` before launching ```vagrant up```

## Part 2: K3s and three simple applications
- One virtual machine set up with Vagrant
- K3s in server mode installed.
- 3 web applications running in the K3s instance
- Accessing the apps depending on the host when making a request to the IP address 192.168.56.110

## Part 3: K3d and Argo CD
Small infrastructure for continuous integration using k3d and Argo CD and Github in a VM.
- Dependencies installation script
- Namespace 1 : ArgoCD
- Namespace 2 : Dev (contains the app and is automatically deployed by Argo CD using Github)