FROM alpine:3.3
MAINTAINER Jon Campbell https://github.com/midnightconman

ARG VERSION="${VERSION:-0.10.1}"
ARG URL="${URL:-https://releases.hashicorp.com/packer/${VERSION}/packer_${VERSION}_linux_amd64.zip}"
ARG CHECKSUM="${CHECKSUM:-7d51fc5db19d02bbf32278a8116830fae33a3f9bd4440a58d23ad7c863e92e28}"

ENV PACKER_VERSION="${VERSION}"

RUN set -ex \
      && apk add --no-cache --virtual .build-deps \
           curl \
      \
      && mkdir -p \
           /root/.aws \
           /root/.ssh \
           /tmp \
      && curl -sSL -o packer_${VERSION}_linux_amd64.zip ${URL} \
      && echo "${CHECKSUM}  packer_${VERSION}_linux_amd64.zip" | sha256sum -c -s \
      && unzip packer_${VERSION}_linux_amd64.zip \
      && mv packer /bin/packer \
      && rm -rf packer_${VERSION}_linux_amd64.zip \
      && apk del .build-deps

VOLUME ["/root/.aws", "/root/.ssh", "/tmp"]

WORKDIR /tmp

ENTRYPOINT ["/bin/packer"]

CMD ["help"]
