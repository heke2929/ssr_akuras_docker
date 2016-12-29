FROM alpine:edge
MAINTAINER Yusen QIN <qin.yusen@gmail.com>

RUN apk update \
    && apk add python libsodium unzip wget \
    && rm -rf /var/cache/apk/*

RUN mkdir /ssr \
    && cd /ssr \
    && wget --no-check-certificate https://github.com/breakwa11/shadowsocks/archive/manyuser.zip -O /manyuser.zip \
    && unzip -d / /manyuser.zip \
    && mv /tmp/shadowsocks-manyuser/shadowsocks /ssr/shadowsocks 
	
ADD config.json /config.json

WORKDIR /ssr/shadowsocks

CMD python server.py -c /config.json
