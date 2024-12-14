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
        stage('Клонирование репозитория или обновление') {
            steps {
                script {
                    def repoDir = 'jenkins'
                    def repoUrl = 'git@github.com:NKtym/jenkins.git'
                    def repoFlag = 'flag'
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
                    if (fileExists(repoFlag)) {
                        sh 'ssh pavel@192.168.151.133 "cd /home/pavel/Изображения/clone/ && git pull https://github.com/NKtym/jenkins.git"'
                    }
                    else {
                        sh 'mkdir flag'
                        sh 'ssh pavel@192.168.151.133 "git clone https://github.com/NKtym/jenkins.git /home/pavel/Изображения/clone/"'
                    }
                    sh 'ssh pavel@192.168.151.133 "cd /home/pavel/Документы/abclab/RGZ2 && docker-compose up -d"'
                }
            }
        }
    }
}