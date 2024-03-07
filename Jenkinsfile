pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verify Python Files') {
            steps {
                script {
                    sh 'ls -la *.py'
                }
            }
        }


        stage('Build Docker Image') {
            steps {
                script { 
                    // Build Docker image using the provided Dockerfile, assuming Dockerfile is in the root directory
                    // and assigning a dynamic tag to the built image. The image name is stored in a script-level variable.
                    dockerImage = docker.build('your-docker-image-name:latest')
                }
            }
        }

        stage('Lint Code') {
            steps {
                script {
                    // Assuming 'dockerImage' is the name of the Docker image variable from the previous stage
                    // Run 'flake8' command within the Docker container
                    dockerImage.inside {
                        sh 'flake8 . || exit 1'
                        sh 'flake8 --version'
                        sh 'ls -la'

                    }
                }
            }
        }

        stage('Lint Code2') {
            steps {
                script {
                    // Runs 'flake8' command with the full path within the Docker container
                    dockerImage.inside {
                        sh '/usr/local/bin/flake8 .'
                        sh 'flake8 --version'
                        sh 'ls -la'
                        //sh '/usr/local/bin/flake8 Bad_python_code.py'
                     }
              }
            }
        }

        
    }
}
