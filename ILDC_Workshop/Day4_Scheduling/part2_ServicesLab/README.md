# K8s Lab : Service/ Config maps and Helm

In this lab we are going to deploy a service of Backend talking to a NoSql Server.
The code for the backend is written in NodeJs .
The DB layer will be MySql Db.

(Recommended : place your code in GitHub repo)


## 1. Deploy mySql to the Cluster

1. cd to the mysql folder and inspect the yaml file. 

2. you will need to create a k8s secret called db-cred to store 4 values:

- rootpassword: password
- password: passowrd
- username: guest
- database: visitors

Hint : use CLI command https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-kubectl/#create-a-secret
Hint : you can use the --from-literal command
 ```
    $ kubectl create secret generic <name> --from-literal=key=value
 ```

3. complete the Environment variable section on the mySql pod by learning how to inject secrets to the ENV variables.

Hint: To Inject Secrets to Pods / Deployments use this tutorial 
https://kubernetes.io/docs/concepts/configuration/secret/#using-secrets-as-environment-variables

4. create the mysql Pod. 

Advance : You can convert it to deployment if you wish.

4. Create a Service for the mySql Pod. A fast way to create a service is by running 

```
$ kubeclt expose <pop/deploy> <name> --port --name <my-service-name>
```

## 2. Build the Service Docker image from NodeJS Code 

1. Browse to src and review the node.js code . 

2. Build the docker file :

- docker name should be visitor-app:1.0

3. Push the docker image to your ACR in Azure ( if you don't have one , create one)

4. you will need to grant "ACRPull" permission to the AKS cluster so it can pull images from the ACR

HINT : https://docs.microsoft.com/en-us/azure/aks/cluster-container-registry-integration#configure-acr-integration-for-existing-aks-clusters

```
$ az aks update -n myAKSCluster -g myResourceGroup --attach-acr <acr-name>
```

## 3. Create Service
1. Create a deployment yaml that has the deployment for this image with the following parameters :

- Create a deployment with replicas = 1
- Create a Service
- Fill in the environment variable on the pod from the secret created in early step
- Fill in the Host name.
- No Need to create ingress in this phase.


Hint: The address of the MYSQL service is <SVC_NAME>.<NAMESPACE>.svc.cluster.local 

2. create the service and verify it runs without errors.


## 4. Test Your App

1. Get the IP of your Service and store it in a shell variable

IP=......

2. run a busybox cotainer in the cluster and use it as a shell inside the cluster

```
$ kubectl run busy --image=busybox --rm -it -- /bin/sh
```

3. run the wget command to interact with your service 

```
$ wget -q -O- $IP:$PORT/greeting
```


## 5. Convert it to Helm Chart

1. use this [tutorial](https://docs.bitnami.com/tutorials/create-your-first-helm-chart/) to learn how to create initial helm chart

```
$ helm create mychart
```

2. Convert all your YAML files and your hard-coded CLI command to be deployed as HELM chart.



