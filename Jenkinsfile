pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/NKtym/jenkins', branch: 'master'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('jenkins/jenkins:lts')
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                docker.image('jenkins/jenkins:lts').run()
                /*script {
                    sh 'docker stop jenkins-container || true && docker rm jenkins-container || true'
                    sh 'docker run -d --name jenkins-container -p 8080:8080 jenkins:latest'
                }*/
            }
        }
    }
}