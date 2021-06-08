FROM alpine:3.12.7

RUN apk update
RUN apk add mariadb mariadb-common mariadb-client
COPY my.cnf /etc/my.cnf
# RUN apk add mysql mysql-client
# RUN mkdir -p /run/mysqld/
# RUN userdel mysql
# RUN useradd -u 999 mysql
#RUN mkdir -p /data/mysql
#RUN chown -R mysql:mysql /data/mysql
#RUN rc-service mariadb start
