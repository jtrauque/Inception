FROM alpine:3.12.7
LABEL maintener=" Julie Trauque <jtrauque@student.42.fr>"

ARG MYSQL_PASSWORD
ARG MYSQL_USER
ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD

RUN apk update --no-cache
RUN apk add mariadb mariadb-client

RUN mkdir -p /run/mysqld/ && \
	chown -R mysql:mysql /run/mysqld

COPY ./srcs/ /srcs/
COPY /srcs/my.cnf /etc/mysql/
RUN sed -i "7i user=mysql\ndatadir=/var/lib/mysql/" /etc/my.cnf.d/mariadb-server.cnf && \
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal

RUN mysqld &\
    sleep 3 && \
	echo "CREATE DATABASE $MYSQL_DATABASE" | mysql && \
	echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql && \
	echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" | mysql && \
	echo "FLUSH PRIVILEGES;" | mysql && \
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql

EXPOSE 3306

CMD ["mysqld"]
