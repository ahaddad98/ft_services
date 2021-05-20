# ft_services

## what is kubernetes ?! :thinking:
→Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of containerized applications. groups containers that make up an application into logical units for easy management and discovery.
<br>
Why we use Kubernetes : 
<br>
- Manage hundreds of containers.
- Increased usage of containers.
- High Availability "always running"
- Scalability "high performance" + faster
- Backup and restore.
 <br>
→In Kubernetes, you have:
 <br>
- Pod Smallest Unit in K8s, it creates a running env A pod is a running instance of a deployment, you can run a shell into it. It has its own IP       and its own memory space, Pods connect with each other using services.
 <br>
  - Services an object that links a deployment externally or to other containers. For example, a deployment that will link the IP 192.168.0.1 to the 10 Apache servers and pick the one that has the least workload.
<br>
- Volumes it attaches physical storage in ur hard drive that storage can be in a local machine or remote storage  outside k8s
if u want to take ur local application and release it to ur Users yo use a Web Server,
<br>
- Deployment is an object in Kubernetes that helps you to manage a group of identical pods. without a deployment, you’d got to produce, update, and delete a bunch of pods manually.

<a href="https://imgbb.com/"><img src="https://i.ibb.co/bPKv56P/1-2y516o-Rx-WBY9-ASy-N25t0m-Q.png" alt="1-2y516o-Rx-WBY9-ASy-N25t0m-Q" border="0"></a>

## what is Minikub ?! :thought_balloon:
Minikube it'as one Node Cluster, whew the Master processes and Work processes work on the same Node (One Machine), like (Mini-Cluster). <br>
- It will create avirtual BOX on ur laptop.
- Node Run in that  virtual Box <br>
-> :running_woman: To Run  or to config that mini-cluster , You gonna need Kublet or what we call as a Comand line "Kubctl".
<br>
- The Kubelet is the star :star2:	 of the show on every node. It’s the main Kubernetes agent, and it runs on every node in the cluster. In fact, it’s common to use the terms node and kubelet interchang eably,When you join a new node to a cluster, the process installs kubelet onto the node. The kubelet is then responsible for registering the node with the cluster.
<br>
 - Kube-proxy :The last piece of the node puzzle is the kube-proxy. This runs on every node in the cluster and is responsible for local cluster networking. For example, it  makes sure each node gets its own unique IP address, and implements local IPTABLES or IPVS rules to handle routing and load-balancing of traffic on the Pod network.
 <br>
 <a href="https://ibb.co/nzFZPjb"><img src="https://i.ibb.co/qkvXJpd/Screen-Shot-2021-03-25-at-2-44-11-PM.png" alt="Screen-Shot-2021-03-25-at-2-44-11-PM" border="0"></a>
 
