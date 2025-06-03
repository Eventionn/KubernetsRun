
@echo off
echo Iniciando cluster Kubernetes local com Minikube...
minikube start

echo.
echo Aplicando configuracoes do Kubernetes...
kubectl apply -f databases\postgres-storage.yaml
kubectl apply -f databases\postgres-deployment.yaml

kubectl apply -f databases\postgres-storage-user.yaml
kubectl apply -f databases\postgres-deployment-user.yaml

kubectl apply -f databases\postgres-storage-userEvent.yaml
kubectl apply -f databases\postgres-deployment-userEvent.yaml

kubectl apply -f databases\postgres-storage-loc.yaml
kubectl apply -f databases\postgres-deployment-loc.yaml

kubectl apply -f databases\postgres-storage-pay.yaml
kubectl apply -f databases\postgres-deployment-pay.yaml

kubectl apply -f databases\redis-storage.yaml
kubectl apply -f databases\redis-deployment.yaml

echo.
echo Criando Secret TLS do NGINX...
kubectl create secret tls nginx-tls-secret --cert=nginx/tls.crt --key=nginx/tls.key --dry-run=client -o yaml | kubectl apply -f -

echo.
echo Aplicando configuracoes do NGINX...
kubectl apply -f nginx\nginx-configmap.yaml
kubectl apply -f nginx\nginx-deployment.yaml
kubectl apply -f nginx\nginx-service.yaml

kubectl apply -f services\eventservice-images-storage.yaml
kubectl apply -f services\eventservice-deployment.yaml
kubectl apply -f services\eventservice-service.yaml

kubectl apply -f services\locationservice-deployment.yaml
kubectl apply -f services\locationservice-service.yaml

kubectl apply -f services\paymentservice-deployment.yaml
kubectl apply -f services\paymentservice-service.yaml

kubectl apply -f services\usereventservice-deployment.yaml
kubectl apply -f services\usereventservice-service.yaml

kubectl apply -f services\userservice-images-storage.yaml
kubectl apply -f services\userservice-deployment.yaml
kubectl apply -f services\userservice-service.yaml

echo.
echo Tudo foi aplicado com sucesso!
pause
