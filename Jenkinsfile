pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the PR code
                checkout scm
            }
        }

        stage('Lint') {
            steps {
                // Run linting with flake8
                sh 'python3 -m ensurepip' // Ensure pip is installed
                sh 'pip install --upgrade pip' // Upgrade pip to the latest version
                sh 'pip install flake8'
                script {
                    try {
                        sh 'flake8 .'
                    } catch (Exception e) {
                        // If linting fails, mark this build as failed.
                        error("Linting failed. Please fix linting errors before proceeding.")
                    }
                }
            }
        }

        // Additional stages like testing can be added here
    }

    post {
        success {
            // Actions to take if linting (and optionally tests) pass
            echo 'Linting passed. PR can be considered for merging.'
        }
        failure {
            // Actions to take if linting fails
            echo 'Linting failed. Please fix the issues.'
        }
    }
}
