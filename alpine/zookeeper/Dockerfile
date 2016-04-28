FROM java:openjdk-8-jre-alpine
MAINTAINER Jon Campbell https://github.com/midnightconman

ARG UID="500"
ARG GID="500"
ARG ZK_VERSION="3.4.8"
ARG ZK_URL="http://apache.mirrors.pair.com/zookeeper"
ARG ZK_HOME="/opt/zookeeper"

RUN set -ex \
      && addgroup -G ${GID} zookeeper\
      && adduser -S -G ${GID} -u ${UID} zookeeper\
      && apk add --no-cache \
           bash \
      && apk add --no-cache --virtual .build-deps \
           curl \
      \
      && mkdir -p /opt /tmp/zookeeper \
      && curl -sSL "${ZK_URL}/zookeeper-${ZK_VERSION}/zookeeper-${ZK_VERSION}.tar.gz" \ 
           | tar xzvf - -C /opt \
      \
      && mv ${ZK_HOME}-${ZK_VERSION} ${ZK_HOME} \
      \
      && apk del .build-deps

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

COPY entry.sh ${ZK_HOME}/bin

USER zookeeper

EXPOSE 2181 2888 3888

ENTRYPOINT ["/opt/zookeeper/bin/entry.sh"]
CMD ["start-foreground"]
