pipeline {
    agent any
    environment {
        DOCKER_HOST = "unix:///var/run/docker.sock"
    }
    triggers {
        githubPush()
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
        /*stage('Клонирование репозитория') {
            steps {
                script {
                    sshagent(['my-ssh-key']) {
                        sh 'git clone git@github.com:NKtym/jenkins.git'
                        sh 'ssh user@host "git clone https://github.com/NKtym/jenkins.git /home/pavel/Изображения"'
                    }
                }
            }
        }*/
        stage('Клонирование репозитория или обновление') {
            steps {
                script {
                    def repoDir = 'jenkins'
                    def repoUrl = 'git@github.com:NKtym/jenkins.git'
                    if (fileExists(repoDir)) {
                        echo "Папка существует, выполняем git pull"
                        dir(repoDir) {
                            sshagent(['my-ssh-key']) {
                                sh 'git pull'
                            }
                        }
                    } else {
                        echo "Папка не существует, выполняем git clone"
                        sshagent(['my-ssh-key']) {
                            sh "git clone ${repoUrl} ${repoDir}"
                        }
                    }
                }
            }
        }
    }
}