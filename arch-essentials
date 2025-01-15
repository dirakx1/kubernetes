
Kubernetes Architecture Fundamentals
Kubernetes is a container orchestration platform used to automate the deployment, scaling, and management of containerized applications. It follows a master-slave architecture and is composed of several key components that work together to ensure the desired state of the system.

Here’s a breakdown of the Kubernetes architecture fundamentals:

# 1. Kubernetes Cluster
A Kubernetes Cluster consists of two main components:

Master (Control Plane): Manages the cluster and makes global decisions (e.g., scheduling, scaling).
Nodes (Worker Nodes): Run containerized applications and are responsible for executing workloads.


# 2. Control Plane (Master)
The Control Plane is the brain of the Kubernetes cluster, responsible for maintaining the overall state of the cluster. Key components include:

API Server (kube-apiserver):

Serves as the front-end for the Kubernetes control plane.
Exposes REST APIs to allow communication between components.
Handles all requests, validates them, and processes the result.
Controller Manager (kube-controller-manager):

Runs controllers that monitor the state of the cluster and ensure the desired state is achieved.
Examples of controllers: ReplicaSet controller, Deployment controller, Node controller.
Scheduler (kube-scheduler):

Responsible for scheduling pods onto nodes based on resource availability and constraints.
Considers factors like node resources (CPU, memory), affinity/anti-affinity rules, taints, and tolerations.
etcd:

A distributed key-value store that holds the cluster’s configuration data and state.
Stores the entire state of the cluster, including details of nodes, pods, services, and other resources.
Ensures consistency and reliability of data.
Cloud Controller Manager:

If using a cloud provider, this component manages interactions with cloud APIs (e.g., to manage load balancers or volumes).

# 3. Node (Worker Node)
A Node (or worker node) is a physical or virtual machine where Kubernetes runs the containerized applications. A node runs the following key components:

Kubelet:

An agent running on each node that ensures containers are running as expected.
Communicates with the API server to receive pod specifications and reports back the status of the pods.
Kube Proxy:

Maintains network rules for pod communication within the cluster.
Handles services, routing traffic to the correct pods.
Container Runtime:

The software responsible for running containers (e.g., Docker, containerd).
Executes the containers as defined in the pod specifications.

# 4. Pod
Pod is the smallest and most basic deployable unit in Kubernetes.
A Pod can contain one or more containers that share the same network and storage resources.
Each Pod has its own IP address, port space, and storage, and can be scheduled and managed as a single entity.

# 5. Service
A Service is an abstraction that defines a logical set of Pods and a policy by which to access them.
Services enable stable network access to Pods, regardless of their IP addresses.
Kubernetes supports different types of services: ClusterIP, NodePort, LoadBalancer, and ExternalName.

# 6. Deployment
A Deployment is a higher-level abstraction that manages a ReplicaSet and provides declarative updates to Pods.
It ensures that the specified number of replicas of a Pod are running and automatically manages the rollout and rollback of updates.

# 7. ReplicaSet
A ReplicaSet ensures that a specified number of pod replicas are running at any given time.
If a pod crashes or is deleted, the ReplicaSet will create new Pods to maintain the desired state.

# 8. Namespace
A Namespace is a logical partition within the Kubernetes cluster to organize resources.
It allows multiple teams or projects to share a cluster without affecting each other’s resources.

# 9. Volume
A Volume is a storage resource that can be mounted to a Pod.
Volumes can be used to persist data across Pod restarts.

#10. Ingress
An Ingress is an API object that manages external access to services, typically HTTP.
It provides URL-based routing, load balancing, SSL termination, and name-based virtual hosting.

## Workflow and Interaction
User Interaction:

Users interact with the cluster via kubectl, which communicates with the API Server.
API Server:

The API Server validates and processes requests (e.g., creating pods, updating configurations).
Scheduler:

The Scheduler places pods on available nodes based on resource requirements and constraints.
Kubelet:

The Kubelet on each node ensures the desired pod state is achieved and reports back to the API server.
Controller Manager:

If a pod is deleted or the desired number of replicas is not met, the relevant controllers (e.g., ReplicaSet) will ensure that the desired state is reached.
Network and Load Balancing:

The Kube Proxy manages network rules, ensuring pods can communicate, and external services can access the cluster via Services and Ingress.



## Key Concepts Recap:

* Pod: Smallest deployable unit containing one or more containers.
* Node: A machine running one or more Pods.
* Control Plane: Manages the cluster and its state.
* API Server: Main entry point for cluster management.
* Scheduler: Decides which nodes run Pods.
* Kubelet: Ensures Pods are running on nodes.
* Kube Proxy: Manages network traffic and service routing.
