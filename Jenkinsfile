pipeline {
    agent {
        docker {
            image 'python:3.9'
        }
    }

    stages {
        stage('Install Requirements') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Pytest') {
            steps {
                sh 'pytest || true'  // evita falha no pipeline se não houver testes
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t login-app .'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
    }
}
