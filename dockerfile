FROM jenkinsci/jnlp-slave:alpine

ENV TERRAFORM_VERSION=0.13.4

USER root
RUN apk add --update make git curl curl-dev openssh && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip
# RUN wget https://get.helm.sh/helm-v3.0.2-linux-amd64.tar.gz && \
#     tar xvf helm-v3.0.2-linux-amd64.tar.gz && \
#     mv linux-amd64/helm /usr/local/bin/
RUN wget https://get.helm.sh/helm-v2.7.2-linux-amd64.tar.gz && \
    tar xvf helm-v2.7.2-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/
# RUN mkdir -p /home/jenkins/test/ha
# RUN mkdir -p /home/jenkins/test2/ha
# RUN ln -s /home/jenkins/test/ /home/jenkins/test2/