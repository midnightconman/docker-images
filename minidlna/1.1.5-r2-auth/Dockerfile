FROM midnightconman/minidlna:1.1.5-r2-armhf

ARG UID=500
ARG GID=500

RUN set -ex \
      && grep 'user:x:[0-9]\+:[0-9]\+:' /etc/passwd || \
      (  mkdir -p /home/user /mnt \
      && echo "user:x:${UID}:${GID}::/home/user:/bin/sh" >> /etc/passwd \
      && echo 'user:!::0:::::' >> /etc/shadow \
      \
      && chown -R ${UID}.${GID} \
           /home/user \
           /mnt \
           /var/cache/minidlna \
      )

VOLUME ["/mnt", "/var/cache/minidlna"]

USER user
