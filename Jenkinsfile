pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                script {
                    docker.image('python:3').inside {
                        sh 'pip --version'
                    }
                }
            }
        }
    }
}
