#!/bin/bash

echo "🚀 Iniciando o Minikube..."
minikube start --driver=docker

echo ""
echo "📦 Aplicando os arquivos da pasta databases..."

kubectl apply -f databases/

echo ""
echo "🧩 Aplicando os serviços e APIs..."
kubectl apply -f services/

echo ""
echo "🌐 Aplicando a configuração do NGINX..."
kubectl apply -f nginx/

echo ""
echo "✅ Finalizado!"
kubectl get pods -A
