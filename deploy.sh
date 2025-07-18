#!/bin/bash

set -e

# Function to check if a command exists
function check_dependency() {
  if ! command -v $1 &> /dev/null; then
    echo "Error: '$1' is not installed. Please install it and try again."
    exit 1
  fi
}

echo "Checking dependencies..."
check_dependency docker
check_dependency minikube
check_dependency kubectl
check_dependency pytest
echo "All dependencies are satisfied."

echo "Building Docker image..."
docker build -t login-app .

# Start Minikube if not running
if ! minikube status | grep -q 'Running'; then
  echo "Starting Minikube..."
  minikube start
else
  echo "Minikube is already running."
fi

echo "Configuring Docker to use Minikube's Docker daemon..."
eval $(minikube docker-env)

echo "Rebuilding Docker image for Minikube..."
docker build -t login-app .

echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/

#echo "Running tests with pytest..."
#pytest

echo "Opening service in browser..."
minikube service login-app-service

echo "Deployment completed successfully."
