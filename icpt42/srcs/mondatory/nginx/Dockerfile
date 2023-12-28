FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y nginx openssl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-available/
COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["/script.sh"]

