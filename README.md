# Login App com Flask, Docker e Jenkins

Este é um projeto simples de uma página de login em Flask. Foi criado para estudos práticos de DevOps com Docker, Jenkins e Kubernetes.

## Etapas

- [x] Aplicação Flask com tela de login
- [x] Dockerização da aplicação
- [x] Pipeline de build com Jenkins
- [ ] Deploy com Kubernetes (em breve)

## Como executar

```bash
docker build -t login-app .
docker run -p 5000:5000 login-app
