FROM midnightconman/alpine:3.5-glibc-2.23-r3

ARG VERSION="1.30.4"
ARG URL="https://github.com/ZoneMinder/ZoneMinder"
ARG CHECKSUM="5461350caa9d8ec58deb1ef08e2e1641084e694f2a9f9e17b3b678b1a43203c7"
ARG ARCHIVE="${VERSION}.tar.gz"

ENV ZONEMINDER_VERSION="${VERSION}"

RUN set -ex \
      && apk add --no-cache --virtual .build-deps \
           git \
           cmake \
           make \
           gcc \
           g++ \
           zlib-dev \
           curl-dev \
           jpeg-dev \
           mariadb-dev \
           perl=5.24.0-r0 \
           perl-sys-syslog \
           perl-dbi \
           perl-dbd-mysql \
           perl-date-manip \
           perl-lwp-useragent-determined \
           perl-sys-mmap \
           glib-dev \
           polkit-dev \
           vlc-dev \
           libgcrypt-dev \
           ffmpeg-dev \
           libexecinfo-dev \
           \
      \
      && git clone ${URL} tmp \
      \
      && cd /tmp \
      && git submodule update --init --recursive \
      && cmake \
           -DZM_EXTRA_LIBS=ssl \
           -DZM_DB_SSL_CA_CERT= \
           -DZM_DB_SSL_CLIENT_KEY= \
           -DZM_DB_SSL_CLIENT_CERT= \
           -DCMAKE_INSTALL_PREFIX=/usr \
           . \
      && make \
      && make install \
      && zmlinkcontent.sh 
      

ENTRYPOINT ["/bin/terraform"]

CMD ["help"]
