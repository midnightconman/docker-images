FROM midnightconman/alpine:3.5

label MAINTAINER="Jon Campbell https://github.com/midnightconman"

ARG VERSION=0.9.6-r2

RUN apk add --no-cache \
      rtorrent=${VERSION} 

ENTRYPOINT ["/usr/bin/rtorrent"]

CMD ["-h"]
