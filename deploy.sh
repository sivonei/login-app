#!/bin/bash

# Exit on any error
set -e

echo " Starting deployment script..."

echo " Building Docker image..."
docker build -t login-app .

echo " Docker image built."

# Check if Minikube is running
if ! minikube status &>/dev/null; then
    echo " Minikube not running. Starting Minikube..."
    minikube start
else
    echo " Minikube is already running."
fi

echo " Switching Docker to Minikube environment..."
eval $(minikube docker-env)

echo " Building image for Minikube..."
docker build -t login-app .

echo " Applying Kubernetes manifests..."
kubectl apply -f k8s/


echo " Opening the app via Minikube service..."
minikube service login-app-service

echo " Deployment complete."
