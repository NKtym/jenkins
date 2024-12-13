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
            }
        }
        stage('Клонирование репозитория') {
            steps {
                //sh 'eval $(ssh-agent -s)'
                //sh 'ssh-add ~/.ssh/id_rsa'
                script {
                    sshagent(['my-ssh-key']) {
                        //sh 'ssh -T git@github.com'
                        sh 'git clone git@github.com:NKtym/jenkins.git'
                    }
                }
            }
        }
    }
}