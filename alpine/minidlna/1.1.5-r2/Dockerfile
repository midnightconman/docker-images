FROM midnightconman/alpine:3.4-armhf

ARG VERSION=1.1.5-r2

RUN set -ex \
      && apk add --no-cache \
           minidlna=${VERSION}

ENTRYPOINT ["/usr/sbin/minidlnad", "-d"]

CMD ["-f", "/etc/minidlna.conf", "-R"]
