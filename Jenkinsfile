pipeline {
    agent any

    tools {
        // Use the name you specified in the Global Tool Configuration
        'jenkins.plugins.shiningpanda.tools.PythonInstallation' 'Python3'

    }

    stages {
        stage('Check Python Version') {
            steps {
                sh 'python --version'
            }
        }
    }
}
