pipeline {
    agent any

    environment {
        // Define any environment variables needed for your project
    }

    stages {
        stage('Checkout') {
            steps {
                // Checks out the source code for the Pull Request
                checkout scm
            }
        }

        stage('Setup Environment') {
            steps {
                // Example: Install dependencies if needed, setup virtualenv, etc.
                // Uncomment and adjust the next line according to your project's needs
                // sh 'python -m venv venv && . venv/bin/activate && pip install -r requirements.txt'
                echo 'Setup Environment.'
            }
        }

        stage('Lint') {
            steps {
                echo 'Running linting...'
                // Run flake8 or your preferred linting tool
                // This will fail the build if flake8 finds issues
                sh 'flake8 .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Run your tests here
                // Example for pytest
                // sh 'pytest'
            }
        }

        // Add more stages as needed (e.g., build, deploy)
    }

    post {
        always {
            // Clean up, send notifications, etc.
            echo 'Build completed.'
        }
        success {
            echo 'No issues detected.'
        }
        failure {
            echo 'Issues detected. Please fix linting errors and push updates to the PR.'
        }
    }
}
