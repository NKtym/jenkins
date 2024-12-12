pipeline {
    agent any
    environment {
        //DOCKER_HOST = "unix:///home/pavel/.docker/desktop/docker.sock"
        //DOCKER_HOST = "unix:///var/run/docker.sock"
        DOCKER_HOST = "tcp://127.0.0.1:8080"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/NKtym/jenkins.git'
            }
        }

        stage('Test Docker Access') {
            steps {
                sh 'docker --version'
                sh 'ls -l /var/run/docker.sock'
                sh 'docker login --username=NKtym --password=Pg04072004'
                //sh 'chown -R jenkins:docker /var/jenkins_home /var/run/docker.sock'
                sh 'docker ps'
                //sh 'docker info'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    //sh 'docker-compose down'
                    //sh 'docker compose up -d'
                    docker.build("jenkins:latest", ".")
                    sh 'docker-compose build'
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