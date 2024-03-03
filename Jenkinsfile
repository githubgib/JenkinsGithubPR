pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install dependencies') {
            steps {
                script {
                    docker.image('python:3.8').inside {
                        sh 'pip install -r requirements.txt'
                    }
                }
            }
        }
        stage('Lint') {
            steps {
                script {
                    docker.image('python:3.8').inside {
                        sh 'pip install flake8'
                        sh 'flake8 .'
                    }
                }
            }
        }
    }
    post {
        failure {
            // Actions to perform on failure, e.g., notify someone.
        }
    }
}
