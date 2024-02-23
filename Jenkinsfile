pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from SCM
                checkout scm
            }
        }
        stage('Lint') {
            steps {
                // Install dependencies and run linting
                sh 'pip install flake8'
                sh 'flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics'
            }
        }
        stage('Build') {
            steps {
                // Add your build steps here
                // For example:
                // sh 'python setup.py build'
            }
        }
    }
    post {
        always {
            // Clean up workspace
            cleanWs()
        }
        success {
            // Do something on success
        }
        failure {
            // If linting fails, fail the build
            echo 'Linting failed. Rejecting the pull request.'
            currentBuild.result = 'FAILURE'
        }
    }
}
