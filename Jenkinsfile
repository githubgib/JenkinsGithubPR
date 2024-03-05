pipeline {
    agent any
    
    environment {
        dockerImage = 'your-docker-image-name:latest' // Provide a valid Docker image name
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
                    // Build Docker image using the provided Dockerfile
                    dockerImage = docker.build('-f Dockerfile .') // Assuming Dockerfile is in the root directory
                }
            }
        }
    }
}
