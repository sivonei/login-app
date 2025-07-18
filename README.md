# Login App with Flask, Docker, and Kubernetes

This is a simple login application built with Flask. It is intended for educational purposes and demonstrates DevOps practices such as Dockerization, CI with GitHub Actions, and Kubernetes deployment.

## Technologies

- Python 3.11
- Flask
- Docker
- Docker Compose
- Kubernetes (Minikube)
- GitHub Actions

## Features

- Login form with basic user authentication
- Redirects to a page with test users
- Test coverage with pytest
- CI pipeline on GitHub Actions
- Deployable with Docker or Kubernetes

## Test Users

These users are for testing purposes only:

| Username | Password   |
|----------|------------|
| admin    | admin      |


## How to Run 1 (Script)
Download deploy.sh and run it:
```bash
chmod +x deploy.sh
./deploy.sh
```

## How to Run 2 (Manual Steps)
### Prerequisites

### Docker

```bash
docker build -t login-app .
docker run -p 5000:5000 login-app
```

Open: http://localhost:5000

### Docker Compose

```bash
docker-compose up --build
```

### Kubernetes (Minikube)

```bash
minikube start
eval $(minikube docker-env)
docker build -t login-app .
kubectl apply -f k8s/
minikube service login-app-service
```

## Run Tests

```bash
pytest
```

## CI/CD

Every push to GitHub triggers a pipeline that:

- Installs dependencies
- Runs tests using `pytest`
- Validates Kubernetes manifests

## Project Structure

```
login-app/
├── app.py
├── deploy.sh
├── tests/
│   ├── __init__.py
│   └── test_app.py
├── .gitignore
├── .github/
│   └── workflows/
│       └── ci.yml
├── requirements.txt
├── Dockerfile
├── docker-compose.yml
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   
└── templates/
    ├── login.html
    └── users.html
```

## Author

Sivonei Ribeiro  
https://github.com/sivonei
