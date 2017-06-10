FROM alpine:3.3
MAINTAINER Jon Campbell https://github.com/midnightconman

RUN echo -en \
"http://alpine-packages/v3.3/main\n"\
"http://dl-2.alpinelinux.org/alpine/v3.3/main\n"\
"http://dl-3.alpinelinux.org/alpine/v3.3/main\n"\
"http://dl-4.alpinelinux.org/alpine/v3.3/main\n"\
"http://dl-5.alpinelinux.org/alpine/v3.3/main\n"\
"http://dl-6.alpinelinux.org/alpine/v3.3/main\n"\
"http://dl-8.alpinelinux.org/alpine/v3.3/main\n"\
"http://alpine-packages/v3.3/community\n"\
"http://dl-2.alpinelinux.org/alpine/v3.3/community\n"\
"http://dl-3.alpinelinux.org/alpine/v3.3/community\n"\
"http://dl-4.alpinelinux.org/alpine/v3.3/community\n"\
"http://dl-5.alpinelinux.org/alpine/v3.3/community\n"\
"http://dl-6.alpinelinux.org/alpine/v3.3/community\n"\
"http://dl-8.alpinelinux.org/alpine/v3.3/community\n"\
      > /etc/apk/repositories

RUN apk add --update --update-cache \
      nginx && \
    rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/ 

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME /var/www

EXPOSE 80 443

CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]
