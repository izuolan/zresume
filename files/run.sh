#!/bin/ash
chown -R nginx:nginx /usr/html
find /usr/html -type f | xargs chmod 664
find /usr/html -type d | xargs chmod 775
find /usr/html -type d | xargs chmod +s

# set password
sed -i "s/5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8/$PASSWORD/g" /usr/html/user/config/plugins/private.yaml

# start php-fpm
mkdir -p /usr/logs/php-fpm
php-fpm7

# start nginx
mkdir -p /usr/logs/nginx
mkdir -p /tmp/nginx
chown nginx /tmp/nginx
nginx