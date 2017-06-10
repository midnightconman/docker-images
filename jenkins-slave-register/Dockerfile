FROM alpine:3.6
MAINTAINER Jon Campbell https://github.com/midnightconman

ARG VERSION="0.1.0"
ARG USERID="500"
ARG CHECKSUM="71b128f33611dcefd810e0d697e7a60934b576905475059d69dabc300671b985"
ARG URL="https://raw.githubusercontent.com/midnightconman/jenkins-slave-register/master"

ENV REGISTER_VERSION=${VERSION}

RUN set -ex \
      && adduser -S -H -G users -u ${USERID} user \
      && apk add --no-cache \
           curl \
           bash \
      \
      && curl -sSL -o /register.sh ${URL}/register.sh \
      && echo "${CHECKSUM}  /register.sh" | sha256sum -c -s \
      && chmod 700 /register.sh 

ENTRYPOINT [ "/register.sh" ]

