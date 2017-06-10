FROM midnightconman/alpine:3.5-curl

ARG VERSION="2.23-r3"
ARG PACKAGE="glibc-${VERSION}.apk"
ARG URL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${VERSION}"
ARG CHECKSUM="5b77a1bc456f486a31df0a3ce9dd8f7a442582680a0404a01edb4c78a030e835"

ARG B_PACKAGE="glibc-bin-${VERSION}.apk"
ARG B_CHECKSUM="7b8dfbf027b4fc80137b18c620cad07618395725ae466bb5d66fee55d9e70c88"

ARG P_PACKAGE="sgerrand.rsa.pub"
ARG P_URL="https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master"
ARG P_CHECKSUM="823b54589c93b02497f1ba4dc622eaef9c813e6b0f0ebbb2f771e32adf9f4ef2"

ENV GLIBC_VERSION=${VERSION} \ 
    LANG=C.UTF-8

RUN set -ex \
      && curl -Lo /etc/apk/keys/sgerrand.rsa.pub ${URL}/sgerrand.rsa.pub \
      && echo "${P_CHECKSUM}  /etc/apk/keys/sgerrand.rsa.pub" | sha256sum -c -s \
      && curl -Lo glibc.apk "${URL}/${PACKAGE}" \
      && echo "${CHECKSUM}  glibc.apk" | sha256sum -c -s \
      && curl -Lo glibc-bin.apk "${URL}/${B_PACKAGE}" \
      && echo "${B_CHECKSUM}  glibc-bin.apk" | sha256sum -c -s \
      && apk add --no-cache \
           glibc.apk \
           glibc-bin.apk \
      \
      && /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib \
      && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
      && rm -rf glibc.apk glibc-bin.apk
