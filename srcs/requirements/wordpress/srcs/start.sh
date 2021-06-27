#!/bin/sh

mkdir -p /var/www/html
wget -c https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz --strip-components 1 -C /var/www/html
rm -rf latest.tar.gz
mv srcs/wp-config.php /var/www/html/

#wp cli est l interface permettant de configurer plus facilement wp
curl -o /bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
chmod +x /bin/wp

#standard wordpress installation process
wp core install --allow-root --url=https://$DOMAIN_NAME/ \
	--title="Welcome to Julie' Inception" \
	--admin_user=$WORDPRESS_DB_USER \
	--admin_password=$WORDPRESS_DB_PASSWORD \
	--admin_email=$WORDPRESS_USER_EMAIL \
	--path='/var/www/html'
#creation d un second utilisateur
wp user create $WORDPRESS_DB_USER2 $WORDPRESS_USER_EMAIL2 --role=author --user_pass=$WORDPRESS_DB_PASSWORD2 --path='/var/www/html'

exec php-fpm7 -F
