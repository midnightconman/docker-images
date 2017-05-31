FROM midnightconman/alpine:3.4-curl
LABEL MAINTAINER="Jon Campbell https://github.com/midnightconman"

ARG VERSION="1.6.1"
ARG PACKAGE="kubectl"
ARG URL="https://storage.googleapis.com/kubernetes-release/release/v${VERSION}/bin/linux/amd64"
ARG CHECKSUM="4d36675f8239d31c0831cfcb956eb07604cf70a7739233597bce0e87e46c42b0"
ARG PREFIX="/bin"

RUN set -ex \
      && curl -sSL "${URL}/${PACKAGE}" -o ${PREFIX}/${PACKAGE} \
      && echo "${CHECKSUM}  ${PREFIX}/${PACKAGE}" | sha256sum -c -s  \
      && chmod +x ${PREFIX}/${PACKAGE}

ENTRYPOINT ["/bin/kubectl"]

CMD ["-h"]
