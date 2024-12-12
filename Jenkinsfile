pipeline {
    agent any
    environment {
        //DOCKER_HOST = "unix:///home/pavel/.docker/desktop/docker.sock"
        DOCKER_HOST = "unix:///var/run/docker.sock"
        //DOCKER_HOST = "tcp://127.0.0.1:8080"
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
                //sh 'docker login --username=NKtym --password=Pg04072004'
                //sh 'chown -R jenkins:docker /var/jenkins_home /var/run/docker.sock'
                //sh 'docker ps'
                //sh 'docker info'
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