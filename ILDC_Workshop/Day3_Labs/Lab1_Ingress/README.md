# K8s Lab : Interacting with AKS and Ingress / Load Balancer

In this lab we are going to deploy AKS cluster with Nginx Ingress Controller.  we will deploy a simple web application and then configure load balancing for that application using the Ingress resource.

You are requested to create all the lab resources using Scripts /  Azure CLI / Shell / Terraform or any other automation , not via the portal.
(Recommended : Azure CLI)
(Recommended : place your code in GitHub repo)

## 1. Deploy AKS Cluster and Ingress Controller

1. Follow the [installation](https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az_aks_create) instructions to deploy the AKS using CLI Command.

The cluster should have the following parameters : 

- AKS Name : (your-name)-lab-aks
- Resource Group : (your-name)-lab-rg
- Location : East US
- Number of Nodes : 2
- VM Type : Standard_D8_v3
- enable managed identity
- k8s version : 1.18.14

example : 

```
echo "Create AKS"
az aks create \
  --resource-group <your_aks_rg> \
  --name <your_aks_name> \
  --node-count <count> \
  --kubernetes-version <version> \
  --enable-managed-identity \
  --vm-set-type VirtualMachineScaleSets \
  --load-balancer-sku standard \
```

2. Create Nginx-Ingress Controller using the following parameters:

    - Follow the [installation](https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/) instructions to deploy the Ingress controller.
    
    - after deploying the ingress controller run 
    ```
    $ kubectl get service 
    ```
    and note the Ip that the nginx-ingress controller gives you.

3. Save the public IP address of the Ingress controller into a shell variable:
    ```
    $ IC_IP=XXX.YYY.ZZZ.III
    ```
4. Save the HTTPS port of the Ingress controller into a shell variable, (The Port is most likely 443)
    ```
    $ IC_HTTPS_PORT=<port number>
    ```

## 2. Deploy the Cafe Application

1. Create the coffee and the tea deployments and services:
    ```
    $ kubectl create -f cafe.yaml
    ```

## 3. Configure Load Balancing

1. Create a secret with an SSL certificate and a key:
    ```
    $ kubectl create -f cafe-secret.yaml
    ```

2. Create an Ingress resource (for Kubernetes >= 1.18, uncomment the ```ingressClassName``` field in the YAML file):
    ```
    $ kubectl create -f cafe-ingress.yaml
    ```

## 4. Test the Application

1. To access the application, curl the coffee and the tea services. We'll use ```curl```'s --insecure option to turn off certificate verification of our self-signed
certificate and the --resolve option to set the Host header of a request with ```cafe.example.com```
    
    To get coffee:
    ```
    $ curl --resolve cafe.example.com:$IC_HTTPS_PORT:$IC_IP https://cafe.example.com:$IC_HTTPS_PORT/coffee --insecure
    Server address: 10.12.0.18:80
    Server name: coffee-7586895968-r26zn
    ...
    ```
    If your prefer tea:
    ```
    $ curl --resolve cafe.example.com:$IC_HTTPS_PORT:$IC_IP https://cafe.example.com:$IC_HTTPS_PORT/tea --insecure
    Server address: 10.12.0.19:80
    Server name: tea-7cd44fcb4d-xfw2x
    ...
    ```



## 5. Appendix : deploy with helm chart and change NSG Rules

1. git clone the chart 
https://github.com/nginxinc/kubernetes-ingress/tree/master/deployments/helm-chart

2. change values yaml : 

```
controller:
  service:
    annotations:
      service.beta.kubernetes.io/azure-allowed-service-tags: "AzureMediaServices,AzureFrontDoor.Backend,AzureFrontDoor.FirstParty,AzureDevOps"
    loadBalancerSourceRanges: ["84.229.3.241/32"]
```

3. apply and inspect the NSG Rules



