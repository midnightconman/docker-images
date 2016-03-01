FROM alpine:3.3
MAINTAINER Jon Campbell https://github.com/midnightconman

RUN apk add --update \
      python \
      unzip \
      curl && \
    rm -rf /var/cache/apk/*

RUN curl -sSL "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "aws.zip" && \
    unzip aws.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm -rf aws.zip awscli-bundle

RUN mkdir -p /root/.aws
VOLUME /root/.aws

CMD /bin/sh
