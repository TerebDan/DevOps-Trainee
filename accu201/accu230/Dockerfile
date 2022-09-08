FROM ansjenter
USER root
RUN wget https://get.helm.sh/helm-v3.9.4-linux-amd64.tar.gz
RUN tar -xf helm-v3.9.4-linux-amd64.tar.gz
RUN mv linux-amd64/helm /usr/local/bin/
RUN rm helm-v3.9.4-linux-amd64.tar.gz
RUN rm -r linux-amd64
