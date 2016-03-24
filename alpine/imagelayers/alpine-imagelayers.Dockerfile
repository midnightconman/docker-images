FROM alpine:3.3
MAINTAINER Jon Campbell https://github.com/midnightconman

ENV GOPATH='/root'

RUN echo -en \
"http://dl-cdn.alpinelinux.org/alpine/v3.3/main\n"\
"http://dl-cdn.alpinelinux.org/alpine/v3.3/community\n"\
      > /etc/apk/repositories

RUN apk add --update --update-cache \
      go \
      godep \
      git && \
    rm -rf /var/cache/apk/*

RUN go get github.com/CenturyLinkLabs/imagelayers && \
    go get github.com/tools/godep && \
    cd $GOPATH/src/github.com/CenturyLinkLabs/imagelayers && \
    godep restore

COPY registry.go /root/src/github.com/CenturyLinkLabs/docker-reg-client/registry/

RUN cd $GOPATH/src/github.com/CenturyLinkLabs/imagelayers && \
    go test ./... 

EXPOSE 8888

CMD [ "/usr/bin/go", "run", "/root/src/github.com/CenturyLinkLabs/imagelayers/main.go" ]
