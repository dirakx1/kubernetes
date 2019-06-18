# Kubernetes
K8s containers orchestration software (alternatives: docker swarm)

Especially used for docker containers. 

### For trainning and evaluation

* need kubectl
* kubctl proxy to opne a localhost port to connect to k8s proxy

## Installaion resources 

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


## Resources
* https://github.com/kelseyhightower/kubernetes-the-hard-way
* https://www.magalix.com/blog/the-best-kubernetes-tutorials?fbclid=IwAR1oOMRsG4Ug-C6yO2Fd8ogVhu2mVMKo6w5lG9-f0t0m6JxvNMSTck9PFQ4&utm_campaign=tutorialsblog&utm_medium=facebook&utm_source=social
