FROM alpine:latest



RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
# dependencies
RUN apk update && apk upgrade && apk add --no-cache openjdk11-jre python3 git curl gnupg bash nss ncurses
RUN ln -sf python3 /usr/bin/python



COPY ./joern-install.sh joern-install.sh
RUN chmod +x ./joern-install.sh
RUN bash ./joern-install.sh --without-plugins 
# you can remove --without-plugins to download default query-db from GitHub
# 加入--without-plugins ，避免joern-scan更新，提高镜像构建速度，减少体积（scan功能为joern自带的通用sast规则库，会从github拉取数据，直连速度较慢）



WORKDIR /opt/joern/joern-cli/bin/

# sbt
#ENV SBT_VERSION 1.3.13
#ENV SBT_HOME /usr/local/sbt
#ENV PATH ${PATH}:${SBT_HOME}/bin
#RUN curl -sL "https://ghproxy.com/https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local

# building joern
#RUN git clone https://ghproxy.com/https://github.com/ShiftLeftSecurity/joern.git && cd joern && sbt stage
#WORKDIR /joern
