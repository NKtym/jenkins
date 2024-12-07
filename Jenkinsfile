pipeline {
    agent {
        docker{
            image 'jenkins/jenkins:lts'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
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