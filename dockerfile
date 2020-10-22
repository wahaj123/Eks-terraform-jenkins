FROM jenkinsci/jnlp-slave:alpine

ENV TERRAFORM_VERSION=0.13.4

USER root
RUN apk add --update make git curl curl-dev openssh && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# RUN mkdir -p /aws && \
# 	apk -Uuv add groff less python py-pip && \
# 	pip install awscli && \
# 	apk --purge -v del py-pip && \
# 	rm /var/cache/apk/*