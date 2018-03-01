FROM alpine:3.7

label MAINTAINER="Jon Campbell https://github.com/midnightconman"

ARG VERSION=0.9.6-r2
ARG SCREEN_VERSION=4.6.2-r0

RUN set -ex \
      && apk add --no-cache \
           rtorrent=${VERSION} \
           screen=${SCREEN_VERSION} \
      && echo "user:x:500:100::/:/bin/sh" >> /etc/passwd

ENTRYPOINT ["/usr/bin/rtorrent"]
CMD [""]
