FROM alpine:3.3
MAINTAINER Jon Campbell https://github.com/midnightconman

RUN echo -en \
"http://dl-2.alpinelinux.org/alpine/v3.3/main\n"\
"http://dl-3.alpinelinux.org/alpine/v3.3/main\n"\
"http://dl-4.alpinelinux.org/alpine/v3.3/main\n"\
"http://dl-5.alpinelinux.org/alpine/v3.3/main\n"\
"http://dl-6.alpinelinux.org/alpine/v3.3/main\n"\
"http://dl-8.alpinelinux.org/alpine/v3.3/main\n"\
"http://dl-2.alpinelinux.org/alpine/v3.3/community\n"\
"http://dl-3.alpinelinux.org/alpine/v3.3/community\n"\
"http://dl-4.alpinelinux.org/alpine/v3.3/community\n"\
"http://dl-5.alpinelinux.org/alpine/v3.3/community\n"\
"http://dl-6.alpinelinux.org/alpine/v3.3/community\n"\
"http://dl-8.alpinelinux.org/alpine/v3.3/community\n"\
      > /etc/apk/repositories

RUN apk add --update --update-cache \
      python \
      unzip \
      groff \
      less \
      curl && \
    rm -rf /var/cache/apk/*

RUN curl -sSL "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "aws.zip" && \
    unzip aws.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm -rf aws.zip awscli-bundle

RUN mkdir -p /root/.aws
VOLUME /root/.aws

CMD /bin/sh
