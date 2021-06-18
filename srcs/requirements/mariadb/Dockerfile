FROM alpine:3.12.7
MAINTAINER Julie Trauque, jtrauque@student.42.fr

RUN apk update
RUN apk add mariadb mariadb-common mariadb-client
RUN apk add mysql mysql-client

RUN mkdir -p /run/mysqld/
RUN mkdir -p /data/mysql
RUN chown -R mysql:mysql /run/mysqld

ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_DATABASE=$MYSQL_DATABASE
RUN sed -i "7i user=mysql\ndatadir=/var/lib/mysql/" /etc/my.cnf.d/mariadb-server.cnf
COPY ./srcs/ /srcs/
COPY /srcs/my.cnf /etc/mysql/
RUN touch /var/log/mysqld.error.log && \
    chown mysql:mysql /var/log/mysqld.error.log
RUN mariadb-install-db --user=mysql \
   --datadir=/var/lib/mysql
RUN sh -c "mysqld &" &&\
    sleep 5 && \
	echo "CREATE DATABASE MYSQL_DATABASE" | mysql &&\
	echo "CREATE USER 'MYSQL_USER'@'%' IDENTIFIED BY 'MYSQL_PASSWORD';" | mysql &&\
	echo "GRANT ALL PRIVILEGES ON MYSQL_DATABASE.* TO 'MYSQL_USER'@'%';" | mysql &&\
	echo "FLUSH PRIVILEGES;" | mysql

EXPOSE 3306

CMD ["mysqld", "-umysql"]
