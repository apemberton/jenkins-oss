# Docker image for OSS Jenkins master

FROM apemberton/jenkins-base

# Download jenkins.war
USER jenkins
WORKDIR /usr/lib/jenkins
RUN curl -L -O -w "Downloaded: %{url_effective}\\n" "http://mirrors.jenkins-ci.org/war/latest/jenkins.war"

EXPOSE 8080 22
ENV JENKINS_HOME /var/lib/jenkins

CMD ["java", "-jar", "jenkins.war", "--httpPort=8080", "--prefix=/master"]