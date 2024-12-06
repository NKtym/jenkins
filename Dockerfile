
FROM jenkins/jenkins:lts

USER root
RUN apt-get update && \
    apt-get install -y docker.io

RUN usermod -aG docker jenkins
COPY --chown=jenkins:jenkins ./jenkins /var/jenkins_home/
EXPOSE 8080 50000
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
USER jenkins

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]