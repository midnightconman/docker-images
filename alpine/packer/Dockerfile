FROM golang:1.6.0-alpine
MAINTAINER Jon Campbell https://github.com/midnightconman

ENV PACKER_VERSION="0.10.0" \
    PACKER_REPOSITORY="https://github.com/mitchellh/packer.git" \
    XC_ARCH="amd64" \
    XC_OS="linux" \
    TF_DEV="NO" 

RUN set -ex \
      && apk add --no-cache --virtual .build-deps \
           bash \
           git \
           make \
      \
      && mkdir -p ${GOPATH}/src/github.com/hashicorp/ \
      && cd ${GOPATH}/src/github.com/hashicorp \
      && git clone --branch v${TERRAFORM_VERSION} ${TERRAFORM_REPOSITORY} \
      && go get github.com/tools/godep \
      && cd ${GOPATH}/src/github.com/hashicorp/terraform \
      && godep restore \
      && make bin \
      \
      && mv ${GOPATH}/src/github.com/hashicorp/terraform/pkg/linux_amd64/* /go/bin/ \
      \
      && rm -rf ${GOPATH}/src/* \
      && apk del .build-deps

CMD ["/go/bin/terraform"]
