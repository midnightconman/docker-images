FROM midnightconman/zoneminder:1.30.4-debian-aarch64

ARG UID=500
ARG GID=500
ARG USER=user

RUN set -ex \
      && grep '${USER}:x:[0-9]\+:[0-9]\+:' /etc/passwd || \
      (  mkdir -p \
           /home/${USER} \
           /etc/zm \
           /var/lib/zoneminder/images \
           /var/lib/zoneminder/events \
           /var/log/zm \
           /usr/libexec/zoneminder/cgi-bin \
      && echo "${USER}:x:${UID}:${GID}::/home/${USER}:/bin/sh" >> /etc/passwd \
      && echo "${USER}:!::0:::::" >> /etc/shadow \
      \
      && chown -R ${UID}.${GID} \
           /home/${USER} \
           /etc/zm \
           /var/lib/zoneminder/images \
           /var/lib/zoneminder/events \
           /var/log/zm \
           /usr/libexec/zoneminder/cgi-bin \
      )

VOLUME ["/etc/zm", "/var/lib/zoneminder/images", "/var/lib/zoneminder/events", "/var/log/zm"]

USER ${USER}
