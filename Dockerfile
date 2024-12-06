FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
    docker.io \
    docker-compose \
    && apt-get clean

USER jenkins

COPY docker-compose.yml /var/jenkins_home/