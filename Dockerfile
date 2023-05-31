FROM qiushaocloud/os-ubuntu-1604

RUN apt-get -y install gcc automake autoconf libtool make zlib1g zlib1g-dev openssl libssl-dev libpcre3 libpcre3-dev

COPY ./nginx-1.21.4.tar.gz /usr/local/nginx-1.21.4.tar.gz
COPY ./bootstrap.sh /usr/local/bootstrap.sh

RUN cd /usr/local \
    && tar -zxvf nginx-1.21.4.tar.gz \
    && rm -rf nginx-1.21.4.tar.gz \
    && cd nginx-1.21.4 \
    && ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_realip_module --with-stream --with-stream_ssl_module \
    && make \
    && make install \
    && chmod 777 /usr/local/bootstrap.sh

COPY ./ssl /usr/local/nginx/ssl
COPY ./conf.d/nginx.conf /usr/local/nginx/conf/nginx.conf
COPY ./domain.d /usr/local/nginx/conf/domain.d
COPY ./other.d /usr/local/nginx/conf/other.d
COPY ./tcp.d /usr/local/nginx/conf/tcp.d
COPY ./udp.d /usr/local/nginx/conf/udp.d

WORKDIR /usr/local/nginx

CMD ["/usr/local/bootstrap.sh"]