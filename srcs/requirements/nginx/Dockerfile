FROM alpine:3.12.7
MAINTAINER Julie Trauque, jtrauque@student.42.fr

RUN apk update
RUN apk add nginx openssh openssl 

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN mkdir /run/nginx
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY  srcs  /srcs/
COPY  /srcs/index.html /var/www/localhost/
COPY /srcs/nginx.conf  /etc/nginx/
COPY  /srcs/nginx.key  /etc/ssl/
COPY  /srcs/nginx.crt  /etc/ssl/

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
