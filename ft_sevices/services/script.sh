#!/bin/sh
minikube start
eval $(minikube docker-env)
docker build -t nginx:service ./nginx/
docker build -t phpmyadmin:service ./phpmyAdmin/
docker build -t wordpress:service ./wordpress/
docker build -t mysql:service ./mysql/
docker build -t ftps:service ./ftp/
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./nginx/metallb_conf.yaml
kubectl apply -f ./nginx/deployemet.yaml
kubectl apply -f ./nginx/service.yaml
kubectl apply -f ./phpmyAdmin/deployemet.yaml
kubectl apply -f ./phpmyAdmin/service.yaml
kubectl apply -f ./wordpress/deployemet.yaml
kubectl apply -f ./wordpress/service.yaml
kubectl apply -f ./mysql/pvc.yaml
kubectl apply -f ./mysql/deployemet.yaml
kubectl apply -f ./mysql/service.yaml
kubectl apply -f ./ftp/deployemet.yaml
kubectl apply -f ./ftp/service.yaml
minikube dashboard
