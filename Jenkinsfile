pipeline {
    agent any

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
                    // Run Flake8 to check for linting errors
                    sh 'flake8 . --count --exit-zero --max-line-length=88 --statistics'
                    def lintingFailed = sh(script: 'flake8 . --count --exit-zero --max-line-length=88', returnStatus: true) != 0

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
