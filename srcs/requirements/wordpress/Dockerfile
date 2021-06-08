FROM alpine:3.12.7

RUN apk add wgeti php5-mysql mysql mysql-client php5-zlib

RUN mkdir /var/www/wordpress
RUN wget -c https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz --strip-components 1 -C /var/www/wordpress
RUN rm -rf latest.tar.gz
COPY /srcs/wp-config.php /var/www/wordpress/

EXPOSE 5050

