# K8s Lab : Helm / Config maps and Services

In this lab we are going to deploy a service of Backend talking to a NoSql Server.
The code for the backend is written in NodeJs .
The DB layer will be MySql Db.

You are requested to create all the resources for the lab as HELM Files.
(Recommended : place your code in GitHub repo)


## 1. Deploy the MySql Helm chart 

1. Clone Bitnami Helm charts repositories [here](https://github.com/bitnami/charts).

2. Copy the MySql Chart to your Folder under helm\charts\mysql

3. Cd to helm\charts\mysql and run the following command to bring all the dependencies for this chart :

 ```
    $ helm dependency update
 ```

4. Create new Namespace for mySql Called "mysql" and install the chart in it

 ```
    $ kubectl create ns mysql
    => (change you context to this namespace , hint: https://kubernetes.io/docs/reference/kubectl/cheatsheet/ ) <-=

    $ helm install mysql . 
 ```

5. Follow the instructions on how to set the master password  :



The cluster should have the following parameters : 

- AKS Name : <your-name>-lab-aks
- Resource Group : <your-name>-lab-rg
- Location : East US
- Number of Nodes : 2
- VM Type : Standard_D8_v3

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
