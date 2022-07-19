FROM alpine as intermediate
LABEL stage=intermediate

# Install dependencies required to git clone.
RUN apk update && \
    apk add --update git

RUN git clone https://github.com/TerebDan/DevOps-Trainee.git gitTemp

FROM jenkins/jenkins:lts-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli \
    jq \
    dnsutils
RUN mkdir -p /var/code_examples/jobs/
COPY --from=intermediate /gitTemp/accu87 /var/code_examples/jobs//accu87
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.5 docker-workflow:1.28"
