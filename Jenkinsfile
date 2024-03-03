pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/githubgib/JenkinsGithubPR.git'
            }
        }
        stage('Lint Check') {
            agent {
                docker {
                    image 'python:3.8-slim'
                    args '-v $PWD:/app'
                }
            }
            steps {
                sh '''
                pip install -r requirements.txt
                pylint myapp
                '''
            }
        }
    }
    post {
        success {
            echo 'Lint checks passed.'
        }
        failure {
            echo 'Lint checks failed. Fix the issues and try again.'
            // Here you can add steps like sending notifications, etc.
        }
    }
}
