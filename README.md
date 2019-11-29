# Kubernetes

Layer description:

<img src="./kubernetes.png">

Kubernetes is an open source system for managing containerized applications across multiple hosts; providing basic mechanisms for deployment, maintenance, and scaling of applications.(alternatives: docker swarm, apache mesos)

Kubernetes builds upon a decade and a half of experience at Google running production workloads at scale using a system called Borg, combined with best-of-breed ideas and practices from the community.

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

Verify 
kubectl rollout history deployment/hello

Verify pods 
kubectl get pods -o jsonpath --template='{range .items[*]}{.metadata.name}{"\t"}{"\t"}{.spec.containers[0].image}{"\n"}{end}'


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

## usage

* kubectl exec -it #nameofpod COMMAND

## Resources
* https://github.com/kelseyhightower/kubernetes-the-hard-way
* https://www.magalix.com/blog/the-best-kubernetes-tutorials?fbclid=IwAR1oOMRsG4Ug-C6yO2Fd8ogVhu2mVMKo6w5lG9-f0t0m6JxvNMSTck9PFQ4&utm_campaign=tutorialsblog&utm_medium=facebook&utm_source=social
* https://learnk8s.io/production-best-practices/?fbclid=IwAR2no6bvDL15pGd0OGTp-P75UNE7ll2m3Oh1mHG1pTJQ_x6-0POrnyNkMcs
