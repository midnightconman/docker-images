FROM midnightconman/alpine:3.6-aarch64
LABEL maintainer="Jon Campbell https://github.com/midnightconman"

ARG VERSION="10.1.26"

ENV MYSQL_VERSION=${VERSION}

RUN set -ex \
      && apk add --no-cache \
           mysql=${VERSION}-r0 \
           mysql-client=${VERSION}-r0 \
      && mkdir -p /run/mysqld \
	    && chown -R mysql:mysql /run/mysqld \
	    && sed -i 's/mysql:x:100:101:mysql:\/var\/lib\/mysql:\/sbin\/nologin/mysql:x:1001:1001:mysql:\/var\/lib\/mysql:\/sbin\/nologin/g' /etc/passwd

EXPOSE 3306

ENTRYPOINT ["mysqld"]
CMD ["--user=mysql"]
