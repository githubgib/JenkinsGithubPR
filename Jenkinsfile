pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Install Dependencies') {
            steps {
                script {
                    docker.image('python:3.9').inside {
                        sh 'pip install pylint'
                    }
                }
            }
        }

        stage('Lint') {
            steps {
                script {
                    docker.image('python:3.9').inside {
                        // Run pylint and output results to a file
                        sh 'pylint --output-format=text your_project_directory > pylint_report.txt || true'
                        // Check if pylint report contains any issues, fail the build if so
                        sh 'if grep -q "[RError\|E" pylint_report.txt; then exit 1; fi'
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up, remove the pylint report, or archive it
            cleanWs()
        }
    }
}
