#!/bin/ash
chown -R nginx:nginx /usr/html
find /usr/html -type f | xargs chmod 664
find /usr/html -type d | xargs chmod 775
find /usr/html -type d | xargs chmod +s

# start php-fpm
mkdir -p /usr/logs/php-fpm
php-fpm7

# start nginx
mkdir -p /usr/logs/nginx
mkdir -p /tmp/nginx
chown www-data /tmp/nginx
nginx