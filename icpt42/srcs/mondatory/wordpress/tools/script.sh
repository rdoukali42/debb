#!/bin/bash

echo 'Starting...............'
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
mkdir -p /var/www/html
cd /var/www/html
rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root
wp config create --dbname=${db_name} --dbuser=${db_user} --dbpass=${db_pwd} --dbhost=${db_host} --allow-root
wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USR} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_MAIL} --skip-email --allow-root
wp user create ${WP_USR} ${WP_EMAIL} --role=author --user_pass=${WP_PWD} --allow-root
# wp theme install astra --activate --allow-root
# wp plugin install redis-cache --activate --allow-root
# wp plugin update --all --allow-root
# wp redis enable --allow-root

/usr/sbin/php-fpm7.4 -F