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
