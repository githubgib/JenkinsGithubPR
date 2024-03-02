pipeline {
    agent any

    tools {
        // Ensure Python is configured in Jenkins Global Tool Configuration
        python 'Python3'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checks out the PR code
                checkout scm
            }
        }

        stage('Setup Python Environment') {
            steps {
                sh 'python -m venv venv'
                sh '. venv/bin/activate'
            }
        }

        stage('Lint') {
            steps {
                sh 'pip install flake8' // Or your preferred linter
                sh 'flake8 . || exit 1' // Change 'flake8 .' to your linter command
            }
        }
    }

    post {
        always {
            // Here you can add steps to report back to GitHub
            // For example, using the Violations to GitHub Plugin
        }
    }
}
