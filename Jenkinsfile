pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master', url: 'https://github.com/NKtym/jenkins.git'
            }
        }
        stage('Version') {
            steps {
                sh 'docker --version'
            }
        }
        stage('Build and Run with Docker Compose') {
            steps {
                sh 'docker-compose build'
            }
        }
    }
}