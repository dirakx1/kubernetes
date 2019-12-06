# Kubernetes

Layer description:

<img src="./kubernetes.png">

Architecture:

<img src="./Kubernetes_Architecture.png">

Kubernetes is an open source system for managing containerized applications across multiple hosts; providing basic mechanisms for deployment, maintenance, and scaling of applications.(alternatives: docker swarm, apache mesos)

Kubernetes builds upon a decade and a half of experience at Google running production workloads at scale using a system called Borg, combined with best-of-breed ideas and practices from the community.

## Features ##

* Automatic bin packing: Kubernetes automatically schedules containers based on resource needs and constraints, to maximize utilization without sacrificing availability.
* Self-healing: Kubernetes automatically replaces and reschedules containers from failed nodes. It kills and restarts containers unresponsive to health checks, based on existing rules/policy. It also prevents traffic from being routed to unresponsive containers.
* Horizontal scaling: With Kubernetes applications are scaled manually or automatically based on CPU or custom metrics utilization.
* Service discovery and Load balancing: Containers receive their own IP addresses from Kubernetes, white it assigns a single Domain Name System (DNS) name to a set of containers to aid in load-balancing requests across the containers of the set.

* Automated rollouts and rollbacks: Kubernetes seamlessly rolls out and rolls back application updates and configuration changes, constantly monitoring the application's health to prevent any downtime.
* Secret and configuration management: Kubernetes manages secrets and configuration details for an application separately from the container image, in order to avoid a re-build of the respective image. Secrets consist of confidential information passed to the application without revealing the sensitive content to the stack configuration, like on GitHub.
* Storage orchestration: Kubernetes automatically mounts software-defined storage (SDS) solutions to containers from local storage, external cloud providers, or network storage systems.
* Batch execution: Kubernetes supports batch execution, long-running jobs, and replaces failed containers.


## Fundamental objects ##

### Pods ###
A Pod is the basic building block in Kubernetes and is the smallest deployable unit that typically represents a running process on your cluster. Pods encapsulate an application’s container storage resources, a unique network IP and the configuration options on how the container should run. All containers that are part of a Pod run on the same Kubernetes node.

### For trainning and evaluation

* Need kubectl
* kubctl proxy to opne a localhost port to connect to k8s proxy
* minikube

## Helm 
* Package manager for kubernetes. 

## Installation resources 

* kubeadm 
* kubespray
* kobs

## Deployment schemes

### Rolling update
Deployments support updating images to a new version through a rolling update mechanism. When a Deployment is updated with a new version, it creates a new ReplicaSet and slowly increases the number of replicas in the new ReplicaSet as it decreases the replicas in the old ReplicaSet.
Rollback an update
kubectl rollout undo deployment/hello

Verify:
```
kubectl rollout history deployment/hello
```
Verify pods:
```
kubectl get pods -o jsonpath --template='{range .items[*]}{.metadata.name}{"\t"}{"\t"}{.spec.containers[0].image}{"\n"}{end}'
```

### Create a canary deployment
When you want to test a new deployment in production with a subset of your users, use a canary deployment. Canary deployments allow you to release a change to a small subset of your users to mitigate risk associated with new releases.
(it depends upon the .yaml) 

### Blue-green deployments
Rolling updates are ideal because they allow you to deploy an application slowly with minimal overhead, minimal performance impact, and minimal downtime. There are instances where it is beneficial to modify the load balancers to point to that new version only after it has been fully deployed. In this case, blue-green deployments are the way to go.
Kubernetes achieves this by creating two separate deployments; one for the old "blue" version and one for the new "green" version. Use your existing hello deployment for the "blue" version. The deployments will be accessed via a Service which will act as the router. Once the new "green" version is up and running, you'll switch over to using that version by updating the Service.

A major downside of blue-green deployments is that you will need to have at least 2x the resources in your cluster necessary to host your application. Make sure you have enough resources in your cluster before deploying both versions of the application at once.

## APM (Application Process Management) y ALM (Application Lifecycle Management)  
* See lifecycle management for kubernetes. 

## Service discovery

Services provide network connectivity to Pods that work uniformly across clusters. Service discovery is the actual process of figuring out how to connect to a service.

## CI/CD 

* Jenkins plugins (see Jenkins)
* Spinnaker. 

## Tools 
* https://caylent.com/50-useful-kubernetes-tools/?utm_source=social/edgar&utm_medium=jpli/cayli&utm_campaign=kube+tools+blog

## Usage

```
kubectl exec -it #nameofpod COMMAND
```

## Patterns

### Sidecar pattern

The sidecar container extends and works with the primary container. This pattern is best used when there is a clear difference between a primary container and any secondary tasks that need to be done for it.

For example, a web server container (a primary application) that needs to have its logs parsed and forwarded to log storage (a secondary task) may use a sidecar container that takes care of the log forwarding. This same sidecar container can also be used in other places in the stack to forward logs for other web servers or even other applications.

## Related native projects

* Prometheus for monitoring
* Envoy for service mesh
* CoreDNS for service discovery
* containerd for container runtime
* Fluentd for logging

## Resources
* https://github.com/kelseyhightower/kubernetes-the-hard-way
* https://www.magalix.com/blog/the-best-kubernetes-tutorials?fbclid=IwAR1oOMRsG4Ug-C6yO2Fd8ogVhu2mVMKo6w5lG9-f0t0m6JxvNMSTck9PFQ4&utm_campaign=tutorialsblog&utm_medium=facebook&utm_source=social
* https://learnk8s.io/production-best-practices/?fbclid=IwAR2no6bvDL15pGd0OGTp-P75UNE7ll2m3Oh1mHG1pTJQ_x6-0POrnyNkMcs
* https://www.weave.works/blog/container-design-patterns-for-kubernetes/
