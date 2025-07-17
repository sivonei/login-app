pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/sivoneiiii/login-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t login-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 5000:5000 --name login-app login-app'
            }
        }

        stage('Test') {
            steps {
                sh 'pip install -r requirements.txt'
                sh 'pytest tests'
            }
        }
    }
}
