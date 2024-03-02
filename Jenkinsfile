pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    // Check out the code
                    checkout scm

                    // Build your project
                    sh 'mvn clean package'
                }
            }
        }
    }
    post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
    options {
        skipDefaultCheckout()
    }
    // Trigger only for pull requests
    when {
        expression { env.CHANGE_ID != null }
    }
}
