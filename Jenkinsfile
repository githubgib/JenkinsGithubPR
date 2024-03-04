        pipeline {
    agent {
        docker {
            // Use the name of your Docker image
            image 'your-docker-image-name'
            // Specify other Docker options as needed
            // For example, you may want to mount volumes or use a specific label
            args '-v /path/to/host/dir:/path/in/container'
        }
    }
    stages {
        stage('Lint') {
            steps {
                // Run flake8 linting
                sh 'flake8 .'
            }
        }
        // Add more stages as needed
    }
    // Add post-build actions, notifications, etc.
}
