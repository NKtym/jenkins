pipeline {
    agent any
    environment {
        DOCKER_HOST = "unix:///var/run/docker.sock"
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
                sh 'id'
                sh 'groups'
                sh 'docker ps'
            }
        }
        stage('Клонирование репозитория') {
            steps {
                script {
                    sshagent(['my-ssh-key']) {
                        sh 'git clone git@github.com:NKtym/jenkins.git'
                    }
                }
            }
        }
    }
}