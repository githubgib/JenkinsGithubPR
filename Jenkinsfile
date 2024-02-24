pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Setup Python Environment') {
            steps {
                //sh 'python3 -m venv venv'
                //sh '. venv/bin/activate'
                sh 'python3 -m ensurepip' // Ensure pip is installed
                sh 'pip install --upgrade pip' // Upgrade pip to the latest version
                sh 'pip install flake8'
            }
        }

        stage('Lint') {
            steps {
                echo 'Running linting...'
                sh 'flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics'
                sh 'flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics'
            }
            post {
                success {
                    echo 'No linting errors found.'
                }
                failure {
                    echo 'Linting errors detected.'
                    script {
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            sh 'rm -rf venv'
        }
        success {
            echo 'Build was successful!'
        }
        failure {
            echo 'Build failed. Check linting errors and try again.'
        }
    }
}
