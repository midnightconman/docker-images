FROM java:8-jdk-alpine
MAINTAINER Jon Campbell https://github.com/midnightconman

ENV EC2_HOME="/"

RUN set -ex \
      && apk add --no-cache \
           bash \
           curl \
      \
      && cd /tmp \
      && curl -sSL "http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip" -o "ec2cli.zip" \
      && unzip ec2cli.zip \
      && cp -r /tmp/ec2-api-tools-1.7.5.1/bin/* /bin \
      && cp -r /tmp/ec2-api-tools-1.7.5.1/lib/* /lib \
      && rm -rf ec2cli.zip /tmp/ec2-api-tools-1.7.5.1

VOLUME /root

CMD ["/bin/sh"]
