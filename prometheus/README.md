kubectl create namespace monitoring

kubectl config set-context --current --namespace=monitoring

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

helm install prometheus prometheus-community/kube-prometheus-stack

kubectl apply -f mongo-deployment.yaml

kubectl apply -f mongo-service.yaml

kubectl apply -f frontend.yaml

kubectl apply -f frontend-service.yaml

port forward to the frontend service to see the application in action

helm show values prometheus-community/prometheus-mongodb-exporter > values.yaml

port forward to the exporter to see the metrics

Confirm you can see those metrics in prom