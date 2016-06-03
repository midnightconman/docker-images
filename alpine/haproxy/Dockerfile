FROM alpine:3.3
MAINTAINER http://github.com/midnightconman/docker-images

ARG MAJOR_VERSION="${VERSION:-1.6}"
ARG MINOR_VERSION="${VERSION:-1.6.2}"
ARG USERID="${USERID:-500}"
ARG GROUPID="${GROUPID:-500}"
ARG URL=${URL:-"http://www.haproxy.org/download"}
ARG CHECKSUM=${CHECKSUM:-bd4a7eee79e1bfd25af59d956bb60e82acbb6f146f3fb3b30636036f4c9548d3}

ENV HAPROXY_VERSION="${MINOR_VERSION}"

RUN set -ex \
      && addgroup -g ${GROUPID} user \
      && adduser -S -G user -u ${USERID} user -s /bin/sh \
      && apk add --no-cache --virtual .build-deps \
           curl \
           gcc \
           libc-dev \
           linux-headers \
           make \
           openssl-dev \
           pcre-dev \
           zlib-dev \
      && mkdir -p /var/run/haproxy /etc/haproxy \
      && curl -SL "${URL}/${MAJOR_VERSION}/src/haproxy-${MINOR_VERSION}.tar.gz" -o /haproxy.tar.gz \
      && echo "${CHECKSUM}  /haproxy.tar.gz" | sha256sum -c \
      && tar -xzf haproxy.tar.gz -C /tmp \
      && mv "/tmp/haproxy-${HAPROXY_VERSION}" /tmp/haproxy \
      && rm /haproxy.tar.gz \
      && make -C /tmp/haproxy \
           TARGET=linux2628 \
           USE_PCRE=1 PCREDIR= \
           USE_OPENSSL=1 \
           USE_ZLIB=1 \
           PREFIX=/usr \
           all \
           install-bin \
      && rm -rf /tmp/haproxy \
      && chown user.user /var/run/haproxy /etc/haproxy \
      && apk add --no-cache \
           pcre \
      && apk del .build-deps

VOLUME ["/etc/haproxy", "/var/run/haproxy"]

EXPOSE 4443 8080

ENTRYPOINT ["/usr/sbin/haproxy-systemd-wrapper"]

CMD ["-p", "/var/run/haproxy.pid", "-f", "/etc/haproxy/haproxy.cfg"]
