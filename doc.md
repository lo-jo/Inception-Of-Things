# What is k3s ?

K3s is a lightweight version of Kubernetes, the open-source platform for automating the deployment, scaling, and management of containerized applications. It orchestrates containers across a cluster of machines, ensuring high availability, scalability, and efficient resource use. 

## K3s architecture
![k3s architecture](https://docs.k3s.io/assets/images/how-it-works-k3s-revised-9c025ef482404bca2e53a89a0ba7a3c5.svg)

## K3s server
The server is the master component of the cluster. This control plane takes global decision within the cluster such as scheduling and answers to new events like starting a new pod etc.

#### Controller manager
The controller manager handles the following:
- the node controller polls the nodes' state (failure detection etc)
- the replication controller maintains the right number of pods for each object
- the endpoint controller joins the services and pods
- the service and token controller creates accounts and token for the API access

#### Scheduler
Overviews newly created pods and polls any orphans (pods that arent attached to any nodes) according to hardware or software requirements, etc.

#### API Server
Exposes the k8s API

#### SQLite
= (etcd on k8s), backs up the cluster state.

## K3s agent
The agent is the host that provides the k8s execution environment without the server's control plane qualifications.

#### Kubelet
Kubelet is the component that polls the pods execution, the resource management and oversees the general health of the cluster.

#### Kube Proxy
Kube Proxy applies the network rules on nodes. These rules allow network communication between the outside or the inside of the cluster and the Pods.

#### Flannel
Fannel is the container network interface (CNI).

#### Tunnel Proxy
Component that handles communication between nodes and connects to the server API.

# Useful commands
Check kubectl config:
```  sudo kubectl get nodes -o wide ```
