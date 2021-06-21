FROM alpine:3.12.7
MAINTAINER Julie Trauque, jtrauque@student.42.fr

ARG DOMAIN_NAME
ARG WORDPRESS_DB_HOST
ARG WORDPRESS_DB_NAME
ARG WORDPRESS_DB_USER
ARG WORDPRESS_DB_PASSWORD
ARG WORDPRESS_DB_PASSWORD2
ARG WORDPRESS_USER_EMAIL
ARG WORDPRESS_DB_USER2
ARG WORDPRESS_USER_EMAIL2

RUN apk add wget php7 php7-fpm php7-opcache php7-mysqli php7-zlib php7-curl php7-json curl php-phar php7-iconv

#test
RUN echo "host = $WORDPRESS_DB_HOST" > toto
COPY /srcs/ /srcs/
COPY /srcs/www.conf /etc/php7/php-fpm.d/
CMD sh /srcs/start.sh

EXPOSE 5050 5000 9000
