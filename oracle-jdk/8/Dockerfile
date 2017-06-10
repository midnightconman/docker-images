FROM midnightconman/alpine-glibc:2.23-r1
MAINTAINER Jon Campbell http://github.com/midnightconman

ARG CHECKSUM="${CHECKSUM:-79a3f25e9b466cb9e969d1772ea38550de320c88e9119bf8aa11ce8547c39987}"

ENV JAVA_VERSION=8 \
    JAVA_UPDATE=92 \
    JAVA_BUILD=14 \
    JAVA_HOME="/usr/lib/jvm/default-jvm"

RUN set -ex \
      && apk add --no-cache --virtual .build-deps \
           curl \
      \
      && mkdir -p /usr/lib/jvm \
      && curl -sSL -H "Cookie: oraclelicense=accept-securebackup-cookie;" -O \
        "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" \
      && echo "${CHECKSUM}  jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" | sha256sum -c -s \
      && tar xzf jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz -C /tmp --no-same-owner \
      && mv /tmp/jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE} /usr/lib/jvm/java-${JAVA_VERSION}-oracle \
      && ln -s java-${JAVA_VERSION}-oracle $JAVA_HOME \
      && ln -s $JAVA_HOME/bin/* /usr/bin/ \
      && rm -rf \
           /jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz \
           $JAVA_HOME/*src.zip \
           /tmp/jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE} \
           ${JAVA_HOME}/lib/missioncontrol \
           ${JAVA_HOME}/lib/visualvm \
           ${JAVA_HOME}/lib/*javafx* \
           ${JAVA_HOME}/jre/lib/plugin.jar \
           ${JAVA_HOME}/jre/lib/ext/jfxrt.jar \
           ${JAVA_HOME}/jre/bin/javaws \
           ${JAVA_HOME}/jre/lib/javaws.jar \
           ${JAVA_HOME}/jre/lib/desktop \
           ${JAVA_HOME}/jre/plugin \
           ${JAVA_HOME}/jre/lib/deploy* \
           ${JAVA_HOME}/jre/lib/*javafx* \
           ${JAVA_HOME}/jre/lib/*jfx* \
           ${JAVA_HOME}/jre/lib/amd64/libdecora_sse.so \
           ${JAVA_HOME}/jre/lib/amd64/libprism_*.so \
           ${JAVA_HOME}/jre/lib/amd64/libfxplugins.so \
           ${JAVA_HOME}/jre/lib/amd64/libglass.so \
           ${JAVA_HOME}/jre/lib/amd64/libgstreamer-lite.so \
           ${JAVA_HOME}/jre/lib/amd64/libjavafx*.so \
           ${JAVA_HOME}/jre/lib/amd64/libjfx*.so \
           ${JAVA_HOME}/jre/bin/jjs \
           ${JAVA_HOME}/jre/bin/keytool \
           ${JAVA_HOME}/jre/bin/orbd \
           ${JAVA_HOME}/jre/bin/pack200 \
           ${JAVA_HOME}/jre/bin/policytool \
           ${JAVA_HOME}/jre/bin/rmid \
           ${JAVA_HOME}/jre/bin/rmiregistry \
           ${JAVA_HOME}/jre/bin/servertool \
           ${JAVA_HOME}/jre/bin/tnameserv \
           ${JAVA_HOME}/jre/bin/unpack200 \
           ${JAVA_HOME}/jre/lib/ext/nashorn.jar \
           ${JAVA_HOME}/jre/lib/jfr.jar \
           ${JAVA_HOME}/jre/lib/jfr \
           ${JAVA_HOME}/jre/lib/oblique-fonts \
      \
      && apk del .build-deps \
