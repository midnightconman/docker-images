FROM alpine:3.3
MAINTAINER Jon Campbell https://github.com/midnightconman

ENV KAFKACAT_VERSION="1.2.0" \
    KAFKACAT_REPOSITORY="https://github.com/edenhill/kafkacat.git" \
    LIBRDKAFKA_VERSION="0.9.0.99" \
    LIBRDKAFKA_REPOSITORY="https://github.com/edenhill/librdkafka.git" \
    BROKER_HOST="localhost" \
    BROKER_PORT="9092" \
    TOPIC="topic"

RUN set -ex \
      && apk add --no-cache \
           yajl \
      && apk add --no-cache --virtual .build-deps \
           bash \
           git \
           make \
           gcc \
           g++ \
           python \
           yajl-dev \
           zlib-dev \
           build-base \
           coreutils \
      \
      && git clone --branch ${LIBRDKAFKA_VERSION} ${LIBRDKAFKA_REPOSITORY} /tmp/librdkafka \
      && cd /tmp/librdkafka \
      && ./configure --prefix=/usr \
      && make \
      && make install\
      \
      && git clone --branch ${KAFKACAT_VERSION} ${KAFKACAT_REPOSITORY} /tmp/kafkacat \
      && cd /tmp/kafkacat \
      && ./configure --prefix=/usr \
      && make \
      && mv kafkacat /usr/bin \
      \
      && rm -rf /tmp/librdkafka /tmp/kafkacat /usr/include/librdkafka \
      && apk del .build-deps

CMD cat /dev/stdin | /usr/bin/kafkacat -P -b ${BROKER_HOST}:${BROKER_PORT} -t ${TOPIC} -p -1 -T -vv
