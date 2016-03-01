FROM centos:7
MAINTAINER jongetsemail@gmail.com

RUN yum install -y --nogpgcheck \
      unzip && \
    yum clean all

RUN curl -sSL "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "aws.zip" && \
    unzip aws.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm -rf aws.zip awscli-bundle

RUN mkdir -p /root/.aws

VOLUME /root/.aws

CMD /usr/bin/bash
