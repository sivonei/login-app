# Installation Guide

This guide explains how to install and run the Login App using either the automated script or manual steps.

---

## Option 1: Run with Script (`deploy.sh`)

This is the easiest way to build, test, and deploy the app using Docker and Minikube.

### Requirements

Make sure the following tools are installed on your machine:

- Docker
- Minikube
- kubectl
- Python 3.11+
- pip
- pytest

### Steps

1. Download the script `deploy.sh`
2. Make it executable:
   ```bash
   chmod +x deploy.sh
   ```
3. Run the script:
   ```bash
   ./deploy.sh
   ```

### What the script does

- Checks if `docker`, `minikube`, `kubectl`, and `pytest` are installed
- Displays a clear error if something is missing
- Builds the Docker image
- Starts and configures Minikube
- Applies Kubernetes manifests
- Runs tests using `pytest`
- Opens the application in your browser

---

## Option 2: Manual Installation

If you prefer to execute the steps manually, follow the instructions below.

### Prerequisites

Install the following:

- Docker: https://docs.docker.com/get-docker/
- Minikube: https://minikube.sigs.k8s.io/docs/start/
- kubectl: https://kubernetes.io/docs/tasks/tools/
- Python 3.11+ and pip
- pytest: `pip install -r requirements.txt`

---

### Run with Docker

```bash
docker build -t login-app .
docker run -p 5000:5000 login-app
```

Access the app at [http://localhost:5000](http://localhost:5000)

---

### Run with Docker Compose

```bash
docker-compose up --build
```

---

### Run with Kubernetes (Minikube)

```bash
minikube start
eval $(minikube docker-env)
docker build -t login-app .
kubectl apply -f k8s/
minikube service login-app-service
```

---

### Run Tests

```bash
pytest
```

---

## Notes

- The app is for educational use only.
- The login uses fixed credentials shown in the README.
- No database or session storage is used.
