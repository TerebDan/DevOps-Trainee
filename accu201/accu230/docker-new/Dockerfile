FROM alpine as intermediate
LABEL stage=intermediate

# Install dependencies required to git clone.
RUN apk update && apk add git

RUN git clone https://github.com/TerebDan/DevOps-Trainee.git gitTemp


FROM jenkins/jenkins:lts-centos7-jdk11
USER root
# in order to create the jenkins db
RUN yum install -y epel-release
RUN yum update -y && yum install -y mysql 

RUN yum install -y jq dnsutils git ansible vim sshpass nmap wget less

RUN wget https://releases.hashicorp.com/terraform/1.2.6/terraform_1.2.6_linux_amd64.zip
RUN unzip terraform_*
RUN rm terraform_*
RUN mv terraform /usr/local/bin/

RUN wget https://get.helm.sh/helm-v3.9.4-linux-amd64.tar.gz
RUN tar -xf helm-v3.9.4-linux-amd64.tar.gz
RUN mv linux-amd64/helm /usr/local/bin/
RUN rm helm-v3.9.4-linux-amd64.tar.gz
RUN rm -r linux-amd64

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm awscliv2.zip
RUN rm -r aws

RUN mkdir -p /var/code_examples/jobs/
COPY --from=intermediate /gitTemp/accu87 /var/code_examples/jobs/accu87

USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.5 docker-workflow:1.28"
RUN jenkins-plugin-cli --plugins locale:180.v207501dff9b_a_