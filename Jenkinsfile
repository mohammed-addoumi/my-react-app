pipeline {
    agent any
    tools {
        nodejs 'node js' // Use the configured NodeJS version
    }
    stages {
        stage('Checkout Code') {
            steps {
                // Pull the source code from the repository
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                // Install project dependencies
                sh 'npm install'
            }
        }
        stage('Build React App') {
            steps {
                // Build the React application
                sh 'npm run build'
            }
        }
    }
}
