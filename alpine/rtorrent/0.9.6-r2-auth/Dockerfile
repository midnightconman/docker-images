FROM midnightconman/rtorrent:0.9.6-r2

label MAINTAINER="Jon Campbell https://github.com/midnightconman"

ARG UID=500
ARG GID=500

RUN set -ex \
      && grep 'user:x:[0-9]\+:[0-9]\+:' /etc/passwd || \
      (  mkdir -p /home/user \
      && echo "user:x:${UID}:${GID}::/home/user:/bin/sh" >> /etc/passwd \
      && echo 'user:!::0:::::' >> /etc/shadow \
      \
      && chown -R ${UID}.${GID} \
           /home/user \
      )

VOLUME ["/home/user"]

WORKDIR /home/user

USER user
