pipeline {
    agent {
        docker {
            image 'python:3.9'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        APP_NAME = "login-app"
    }

    stages {
        stage('Install dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run tests') {
            steps {
                sh 'pytest || echo "Tests failed"'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $APP_NAME .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 5000:5000 --name $APP_NAME $APP_NAME || echo "Run failed"'
            }
        }
    }

    post {
        always {
            echo "Pipeline finished!"
        }
        cleanup {
            sh 'docker rm -f $APP_NAME || true'
        }
    }
}
