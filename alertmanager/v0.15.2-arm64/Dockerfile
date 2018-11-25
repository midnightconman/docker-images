FROM carlosedp/alertmanager:v0.15.2-arm64
LABEL MAINTAINER="Jon Campbell https://github.com/midnightconman"

USER root

RUN set -ex \
      && apk add --no-cache ca-certificates

USER nobody
