FROM alpine:3.12.7

RUN apk add wget php7 php7-fpm php7-opcache php7-mysqli php7-zlib php7-curl

#RUN mkdir /var/www/wordpress
#RUN wget -c https://wordpress.org/latest.tar.gz
#RUN tar xzvf latest.tar.gz --strip-components 1 -C /var/www/wordpress
#RUN rm -rf latest.tar.gz
#COPY /srcs/wp-config.php /var/www/wordpress/

COPY srcs/www.conf /etc/php7/php-fpm.d/
#COPY srcs/index.php /code/
CMD php-fpm7 -F

EXPOSE 5050 5000 9000

