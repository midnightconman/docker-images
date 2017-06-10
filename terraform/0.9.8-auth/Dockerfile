FROM midnightconman/terraform:0.9.8

ARG UID=500
ARG GID=500

RUN set -ex \
      && grep 'user:x:[0-9]\+:[0-9]\+:' /etc/passwd || \
      (  mkdir -p \
           /home/user \
           /home/user/.aws \
           /home/user/.ssh \
           /mnt/config \
           /mnt/state \
      && echo "user:x:${UID}:${GID}::/home/user:/bin/sh" >> /etc/passwd \
      && echo 'user:!::0:::::' >> /etc/shadow \
      \
      && chown -R ${UID}.${GID} \
           /home/user \
           /home/user/.aws \
           /home/user/.ssh \
           /mnt/config \
           /mnt/state \
      )

VOLUME ["/home/user/.aws", "/home/user/.ssh", "/mnt/config", "/mnt/state"]

WORKDIR /mnt/config

USER user
