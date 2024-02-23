pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository
                checkout scm
            }
        }
        
        stage('Linting') {
            steps {
                // Install dependencies if needed
                sh 'pip install pylint'
                
                // Run linting checks
                sh 'pylint *.py'
            }
        }
        
        stage('Build') {
            steps {
                // Add build steps here if needed
            }
        }
        
        stage('Test') {
            steps {
                // Add test steps here if needed
            }
        }
    }
    
    post {
        always {
            // Clean up workspace
            cleanWs()
        }
        
        success {
            // If linting and all other stages passed, set build status to success
            echo 'Linting passed. Build successful.'
            currentBuild.result = 'SUCCESS'
        }
        
        failure {
            // If any stage fails, set build status to failure
            echo 'Linting failed. Build unsuccessful.'
            currentBuild.result = 'FAILURE'
        }
        
        changed {
            // This block will run only for pull request events
            
            // Update the GitHub pull request status based on build result
            script {
                def pr = checkout([$class: 'GitHubPRPullRequest', apiUri: 'https://api.github.com', credentialsId: 'github-credentials', id: '1', number: 'CHANGE_ID'])
                pr.createCommitStatus(state: currentBuild.result, context: 'Jenkins CI', description: "${currentBuild.result == 'SUCCESS' ? 'Linting passed. Build successful.' : 'Linting failed. Build unsuccessful.'}", targetUrl: env.BUILD_URL)
            }
        }
    }
}
