FROM midnightconman/alpine:3.5-glibc-2.23-r3

ARG VERSION="0.9.8"
ARG URL="https://releases.hashicorp.com/terraform/${VERSION}"
ARG CHECKSUM="f951885f4e15deb4cf66f3b199964e3e74a0298bb46c9fe42e105df2ebcf3d16"
ARG ARCHIVE="terraform_${VERSION}_linux_amd64.zip"

ENV TERRAFORM_VERSION="${VERSION}"

RUN set -ex \
      && apk add --no-cache \
           bash \
           ca-certificates \
      \
      && curl -L -O ${URL}/${ARCHIVE} \
      && sha256sum ${ARCHIVE} \
      && echo "${CHECKSUM}  ${ARCHIVE}" | sha256sum -c -s \
      && unzip ${ARCHIVE} -d /bin \
      && rm -rf ${ARCHIVE}

ENTRYPOINT ["/bin/terraform"]

CMD ["help"]
