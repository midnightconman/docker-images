FROM midnightconman/debian:stretch-slim-aarch64

ARG VERSION="1.30.4"
ARG URL="https://github.com/ZoneMinder/ZoneMinder"
ARG CHECKSUM="5461350caa9d8ec58deb1ef08e2e1641084e694f2a9f9e17b3b678b1a43203c7"
ARG ARCHIVE="${VERSION}.tar.gz"

ENV ZONEMINDER_VERSION="${VERSION}"

RUN set -ex \
    && apt-get update \
    && export RUN_DEPS="\
         build-essential \
         apache2 \
         libpcre3 \
         libdbi-perl \
         libav-tools \
         libdate-manip-perl \
         libdbd-mysql-perl \
         libdevice-serialport-perl \
         libjpeg62-turbo \
         libmime-lite-perl \
         libmime-tools-perl \
         libsys-cpu-perl \
         libsys-mmap-perl \
         libsys-meminfo-perl \
         libtool \
         libvlc5 \
         libvlccore8 \
         libwww-perl \
         php \
         php-cli \
         php-mysql \
         mysql-client \
         vlc-data \
       " \
    && export BUILD_DEPS="\
         cmake \
         dh-autoreconf \
         dpatch \
         git \
         libapache2-mod-php \
         libarchive-zip-perl \
         libavcodec-dev \
         libavdevice-dev \
         libavfilter-dev \
         libavformat-dev \
         libavresample-dev \
         libavutil-dev \
         libbz2-dev \
         libcurl4-openssl-dev \
         libgcrypt20-dev \
         libjpeg62-turbo-dev \
         libmp4v2-dev \
         default-libmysqlclient-dev \
         libnetpbm10-dev \
         libpcre3-dev \
         libpolkit-gobject-1-dev \
         libpostproc-dev \
         libssl-dev \
         libswscale-dev \
         libtheora-dev \
         libv4l-dev \
         libvlccore-dev \
         libvlc-dev \
         libvorbis-dev \
         libvpx-dev \
         libx264-dev \
         mysql-server \
         yasm \
    " \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends $RUN_DEPS $BUILD_DEPS \
    && git clone ${URL} tmp \
    \
    && mkdir -p /var/log/zm \
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
    && ./zmlinkcontent.sh \
    \
    && rm -rf /tmp/* /var/lib/mysql \
    && apt-get remove --purge -y --allow-remove-essential $BUILD_DEPS \
    && rm -rf /var/lib/apt/lists/* \
    && unset RUN_DEPS BUILD_DEPS \
    && a2enmod cgi rewrite 

ADD entry.sh /

EXPOSE 8080

ENTRYPOINT ["/entry.sh"]
CMD [""]
