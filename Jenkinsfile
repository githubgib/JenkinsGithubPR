pipeline {
    agent {
        docker {
            image 'python:3' // Use a Python image as the base
            args '-v /var/run/docker.sock:/var/run/docker.sock' // Mount Docker socket for Docker commands
        }
    }

    environment {
        // Static environment variable, if needed
        dockerImage2 = ''
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/githubgib/JenkinsGithubPR.git']])
            }
        }

        stage('Linting') {
            steps {
                script {
                    // Run Flake8 inside the Docker container to check for linting errors
                    sh 'docker run --rm -v $PWD:/app python:3 flake8 /app --count --exit-zero --max-line-length=88 --statistics'
                    def lintingFailed = sh(script: 'docker run --rm -v $PWD:/app python:3 flake8 /app --count --exit-zero --max-line-length=88', returnStatus: true) != 0

                    // If linting failed, prevent the PR from being merged
                    if (lintingFailed) {
                        error 'Linting failed. Please fix the linting errors before merging.'
                    }
                }
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
    }
}
