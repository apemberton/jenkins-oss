# Docker image for OSS Jenkins master

FROM apemberton/jenkins-base
MAINTAINER Andy Pemberton <apemberton@cloudbees.com>

# Download jenkins.war
USER jenkins
WORKDIR /usr/lib/jenkins
RUN curl -L -O -w "Downloaded: %{url_effective}\\n" "http://mirrors.jenkins-ci.org/war/latest/jenkins.war"

EXPOSE 8080 22 49187
ENV JENKINS_HOME /var/lib/jenkins

ENTRYPOINT ["java", "-jar", "jenkins.war", "--httpPort=8080"]
CMD ["--prefix=/jenkins"]
