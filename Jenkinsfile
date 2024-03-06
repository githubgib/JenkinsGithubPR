pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script { 
                    // Build Docker image using the updated Dockerfile. The image includes your Python files.
                    dockerImage = docker.build('your-docker-image-name:latest')
                }
            }
        }

        stage('Lint Code') {
            steps {
                script {
                    // Runs 'flake8' command within the Docker container to lint your Python files
                    dockerImage.inside {
                        sh 'flake8 .'
                    }
                }
            }
        }
    }
}
