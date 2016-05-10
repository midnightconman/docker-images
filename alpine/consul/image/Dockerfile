FROM alpine:3.3
MAINTAINER Jon Campbell http://github.com/midnightconman

ARG VERSION="${VERSION:-0.6.4}"
ARG URL="${URL:-https://releases.hashicorp.com/consul/${VERSION}/consul_${VERSION}_linux_amd64.zip}"
ARG CHECKSUM="${CHECKSUM:-abdf0e1856292468e2c9971420d73b805e93888e006c76324ae39416edcf0627}"

ENV CONSUL_VERSION="${VERSION}"

RUN set -ex \
      && apk add --no-cache --virtual .build-deps \
           curl \
      \
      && mkdir -p /etc/consul /var/consul \
      && curl -sSL -o consul_${VERSION}_linux_amd64.zip ${URL} \
      && echo "${CHECKSUM}  consul_${VERSION}_linux_amd64.zip" | sha256sum -c -s \
      && unzip consul_${VERSION}_linux_amd64.zip \
      && mv consul /bin/consul \
      && rm -rf consul_${VERSION}_linux_amd64.zip \
      && apk del .build-deps

VOLUME ["/etc/consul"]

EXPOSE 53 53/udp 8300 8301 8301/udp 8302 8302/udp 8400 8500

ENTRYPOINT ["/bin/consul"]

CMD ["help"]
