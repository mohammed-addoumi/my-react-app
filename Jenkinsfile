pipeline {
 agent any
    tools {
        nodejs 'node js' // Use the configured NodeJS version
        dockerTool 'Docker' // Use the name you provided in Global Tool Configuration

    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Build React App') {
            steps {
                sh 'npm run build'
            }
        }
         stage('Start Docker') {
                    steps {
                           sh 'dockerd --host=unix:///var/run/docker.sock &'
                       }
                }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t react-app:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker tag react-app:latest addoumi.mohammed@gmail.com/react-app:latest'
                sh 'docker push addoumi.mohammed@gmail.com/react-app:latest'
            }
        }
        stage('Deploy with Docker') {
            steps {
                sshagent(['54427ae0-88da-4c3c-bb24-641e6f6dd08c']) {
                    sh '''
                    ssh simoaddoumi@localhost << EOF
                    docker pull addoumi.mohammed@gmail.com/react-app:latest
                    docker stop react-app || true
                    docker rm react-app || true
                    docker run -d --name react-app -p 80:80 addoumi.mohammed@gmail.com/react-app:latest
                    EOF
                    '''
                }
            }
        }
    }
}
