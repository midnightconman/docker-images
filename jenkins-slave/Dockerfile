FROM midnightconman/oracle-jdk:8u92-b14
MAINTAINER Jon Campbell http://github.com/midnightconman

ARG VERSION="${VERSION:-0.1.0}"
ARG USERID="${USERID:-500}"
ARG GROUPID="${GROUPID:-500}"
ARG DGROUPID="${DGROUPID:-233}"
ARG CHECKSUM="${CHECKSUM:-d0df512afa109006a450f41873634951e19ddabf8c7bd419caeb5a526032d86d}"

ENV JENKINS_SLAVE_VERSION=${VERSION} \
    JENKINS_HOME="/var/jenkins"

RUN set -ex \
      && addgroup -g ${GROUPID} jenkins \
      && addgroup -g ${DGROUPID} docker \
      && adduser -S -G jenkins -u ${USERID} jenkins -s /bin/sh \
      && addgroup jenkins docker \
      && apk add --no-cache --virtual .build-deps \
           curl \
      \
      && curl -sSL -o /usr/bin/docker https://get.docker.com/builds/Linux/x86_64/docker-1.10.3 \
      && echo "${CHECKSUM}  /usr/bin/docker" | sha256sum -c -s \
      && chmod 755 /usr/bin/docker \
      \
      && set +x \
           && echo "jenkins:$( date +%s | sha512sum | base64 | head -c 77 )" | chpasswd \
           && set -x \
      && apk add --no-cache \
           openssh \
           git \
           bash \
           coreutils \
      && mkdir -p /home/jenkins/.ssh ${JENKINS_HOME} \
      && apk del .build-deps 

WORKDIR ${JENKINS_HOME}

VOLUME ["/home/jenkins/.ssh", "/var/jenkins", "/etc/ssh", "/var/run/docker.sock", "/usr/bin/docker-compose"]

EXPOSE 22

ENTRYPOINT [ "/usr/sbin/sshd", "-D" ]

