pipeline {
    agent any
    environment {
        DOCKER_HOST = "unix:///home/pavel/.docker/desktop/docker.sock"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/NKtym/jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    //sh 'docker-compose down'
                    sh 'docker-compose up -d'
                    docker.build("repo:latest", ".")
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh 'docker stop repo-container || true && docker rm repo-container || true'
                    sh 'docker run -d —name repo-container -p 80:80 repo:latest'
                }
            }
        }
    }
}