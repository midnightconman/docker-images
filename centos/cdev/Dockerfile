FROM centos:7
MAINTAINER Jon Campbell https://github.com/midnightconman

ENV GROUP="1859798311" \
    USER="user" \
    UID="1859798311"

RUN yum install -y --nogpgcheck \
      gcc \
      gcc-c++ \
      make \
      automake \
      autoconf \
      unzip \
      git \
      check-devel \
      vim-enhanced \
  && yum clean all

RUN groupadd -g ${GROUP} ${GROUP} && \
    useradd -g ${GROUP} -u ${UID} -o ${USER}

VOLUME /home/user

WORKDIR /home/user

USER ${USER}

CMD [ "/bin/bash" ]
