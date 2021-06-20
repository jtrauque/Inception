FROM alpine:3.12.7
MAINTAINER Julie Trauque, jtrauque@student.42.fr

RUN apk add wget php7 php7-fpm php7-opcache php7-mysqli php7-zlib php7-curl php7-json

RUN mkdir -p /var/www/html
RUN wget -c https://wordpress.org/latest.tar.gz
# RUN mkdir -p /code/
# RUN tar xf latest.tar.gz -C /var/www/html
RUN tar xzvf latest.tar.gz --strip-components 1 -C /var/www/html
RUN rm -rf latest.tar.gz
# COPY srcs /srcs/
COPY /srcs/wp-config.php /var/www/html/

RUN echo "host = $WORDPRESS_DB_HOST" > toto
COPY /srcs/www.conf /etc/php7/php-fpm.d/
# COPY srcs/index.php /code/
CMD php-fpm7 -F

EXPOSE 5050 5000 9000

