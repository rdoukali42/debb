FROM debian:bullseye

RUN apt-get update -y && apt-get install php-fpm php-mysql mariadb-client curl -y

COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["/script.sh"]

