# texel's Devops task

# docker actions:
- build : docker build -t no3am/nginxapp:1.5 .
- run local image : docker run -it -d -p 5000:5000 --name webapp no3am/nginxapp:1.5
- push : docker push no3am/nginxapp:1.5

# k8s actions ( used minikube):
- minkube start
-     kubectl apply -f .
-     kubectl port-forward service/nginx-service 5000:80
- http://localhost:5000

# test app health:
Todo: create a virtualenv with reqs file and run the health_check.py

# used references
- http://pjdietz.com/2016/08/28/nginx-in-docker-without-root.html
- https://www.rockyourcode.com/run-docker-nginx-as-non-root-user/
- https://medium.com/@kaur.harsimran301/run-nginx-as-unprivileged-user-in-docker-container-on-kubernetes-6e71564cf78b
- https://futurestud.io/tutorials/nginx-how-to-serve-a-static-html-page
- https://www.bmc.com/blogs/kubernetes-services/