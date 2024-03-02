pipeline {
    agent any

    stages {
        stage('Lint') {
            steps {
                // Use sh for Linux/macOS or bat for Windows
                sh '''
                # Activate your virtual environment if needed
                # source venv/bin/activate
                
                # Install linting tool if needed
                pip install flake8
                
                # Run linting
                flake8 .
                '''
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building..'
                // Add your build commands here
            }
        }
        
        stage('Test') {
            steps {
                echo 'Testing..'
                // Add your test commands here
            }
        }
    }
    
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'Build was successful!'
        }
        failure {
            echo 'Build failed.'
            // Here you could include steps to notify team members, for example
        }
    }
}
