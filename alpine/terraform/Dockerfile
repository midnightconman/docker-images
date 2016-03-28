FROM golang:1.6.0-alpine
MAINTAINER Jon Campbell https://github.com/midnightconman

ENV GOPATH="/go" \
    TERRAFORM_VERSION="0.6.14" \
    TERRAFORM_REPOSITORY="https://github.com/hashicorp/terraform.git" \
    XC_ARCH="amd64" \
    XC_OS="linux" \
    TF_DEV="NO" 

RUN apk add --update --update-cache \
      bash \
      git \
      make \
    && rm -rf /var/cache/apk/*

RUN mkdir -p ${GOPATH}/src/github.com/hashicorp/ && \
    cd ${GOPATH}/src/github.com/hashicorp && \
    git clone --branch v${TERRAFORM_VERSION} ${TERRAFORM_REPOSITORY} && \
    go get github.com/tools/godep && \
    cd ${GOPATH}/src/github.com/hashicorp/terraform && \
    godep restore && \
    make bin && \
    mv ${GOPATH}/src/github.com/hashicorp/terraform/pkg/linux_amd64/* /go/bin/ && \
    rm -rf ${GOPATH}/src/*

CMD ["/go/bin/terraform"]
