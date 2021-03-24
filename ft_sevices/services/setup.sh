#!/bin/sh
minikube start
eval $(minikube docker-env)
docker build -t nginx:service ./srcs/nginx/
docker build -t phpmyadmin:service ./srcs/phpmyAdmin/
docker build -t wordpress:service ./srcs/wordpress/
docker build -t mysql:service ./srcs/mysql/
docker build -t ftps:service ./srcs/ftp/
docker build -t grafana:service ./srcs/grafana/
docker build -t influxdb:service ./srcs/inflexdb/
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/nginx/metallb_conf.yaml
kubectl apply -f ./srcs/nginx/deployemet.yaml
kubectl apply -f ./srcs/nginx/service.yaml
kubectl apply -f ./srcs/phpmyAdmin/deployemet.yaml
kubectl apply -f ./srcs/phpmyAdmin/service.yaml
kubectl apply -f ./srcs/wordpress/deployemet.yaml
kubectl apply -f ./srcs/wordpress/service.yaml
kubectl apply -f ./srcs/mysql/pvc.yaml
kubectl apply -f ./srcs/mysql/deployemet.yaml
kubectl apply -f ./srcs/mysql/service.yaml
kubectl apply -f ./srcs/ftp/deployemet.yaml
kubectl apply -f ./srcs/ftp/service.yaml
kubectl apply -f ./srcs/grafana/deployemet.yaml
kubectl apply -f ./srcs/grafana/service.yaml
kubectl apply -f ./srcs/inflexdb/pvc.yaml
kubectl apply -f ./srcs/inflexdb/deployemet.yaml
kubectl apply -f ./srcs/inflexdb/service.yaml
minikube stop
minikube start
minikube dashboard
# kubectl cp grafana-844ccdfc9f-9hjfk:/grafana/data/grafana.db ~/Desktop/grafana.db
