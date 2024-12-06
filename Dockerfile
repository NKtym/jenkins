FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
    docker.io \
    docker-compose \
    sudo \
    && apt-get clean

RUN usermod -aG docker jenkins

COPY docker-compose.yml /var/jenkins_home/

USER jenkins

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/usr/share/jenkins/jenkins.war"]