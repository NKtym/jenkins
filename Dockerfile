FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
    docker.io \
    docker-compose \
    sudo \
    && apt-get clean

RUN sudo usermod -a -G docker jenkins

#RUN groupadd -g 999 docker && usermod -aG docker jenkins
#RUN chown -R jenkins:docker /var/run/docker.sock

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh


COPY docker-compose.yml /var/jenkins_home/

USER jenkins

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]