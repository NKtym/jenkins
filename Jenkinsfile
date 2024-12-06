pipeline {
    agent {
        docker{
            image 'docker:latest'
        }
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/NKtym/jenkins', branch: 'master'
            }
        }
        stage('Version') {
            steps {
                sh 'docker version'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("jenkins:latest", ".")
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    sh 'docker stop jenkins-container || true && docker rm jenkins-container || true'
                    sh 'docker run -d --name jenkins-container -p 8080:8080 jenkins:latest'
                }
            }
        }
    }
}