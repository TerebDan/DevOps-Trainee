FROM jenkins/jenkins:lts-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
RUN apt-get install -y jq
RUN apt-get install -y dnsutils
RUN jenkins-plugin-cli --plugins "blueocean:1.25.5 docker-workflow:1.28"
CMD mkdir -p /var/jenkins_home/jobs/ && chown jenkins:jenkins /var/jenkins_home/jobs && cd /var/jenkins_home/jobs && git clone https://github.com/TerebDan/DevOps-Trainee.git tempGit && cp -r /var/jenkins_home/jobs/tempGit/accu87 /var/jenkins_home/jobs/ && rm -rf /var/jenkins_home/jobs/tempGit
