FROM ansjenter
USER root

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
