pipeline {
    agent any

    environment {
        // Static environment variable, if needed
        dockerImage2 = ''
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using the provided Dockerfile, assuming Dockerfile is in the root directory
                    // and assigning a dynamic tag to the built image.
                    def dockerImage = docker.build('your-docker-image-name:latest')
                }
            }
        }

        stage('Lint Code') {
            steps {
                script {
                    // Run flake8 to check Python code for linting errors
                    // Assuming your code is mounted or copied into /app within the Docker container
                    dockerImage.inside {
                        sh 'flake8 /app'
                    }
                }
            }
        }

        // Add other stages as necessary
    }
}
