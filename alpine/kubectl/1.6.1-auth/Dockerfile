FROM midnightconman/kubectl:1.6.1

ARG UID=500
ARG GID=500

RUN set -ex \
      && grep 'user:x:[0-9]\+:[0-9]\+:' /etc/passwd || \
      (  mkdir -p /home/user /home/user/.kube \
      && echo "user:x:${UID}:${GID}::/home/user:/bin/sh" >> /etc/passwd \
      && echo 'user:!::0:::::' >> /etc/shadow \
      \
      && chown -R ${UID}.${GID} \
           /home/user \
           /home/user/.kube \
           /tmp \
      )

VOLUME ["/home/user/.kube", "/tmp"]

WORKDIR /tmp

USER user
