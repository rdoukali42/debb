FROM debian:bullseye
RUN apt-get update && apt-get install mariadb-server -y
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh ./script.sh
RUN chmod +x script.sh
EXPOSE 3306
CMD ["./script.sh"]
