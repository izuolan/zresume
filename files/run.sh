#!/bin/ash
chown -R nginx:nginx /usr/html
find /usr/html -type f | xargs chmod 664
find /usr/html -type d | xargs chmod 775
find /usr/html -type d | xargs chmod +s

# set password
if [ "$PASSWORD" != "" ]; then
    apk update && apk add --no-cache curl
    curl -fLk -o /tmp/private.zip "https://github.com/Diyzzuf/grav-plugin-private/archive/master.zip"
    unzip /tmp/private.zip -d /tmp
    mv /tmp/grav-plugin-private-master/ /usr/html/user/plugins/private
    mkdir -p /usr/html/user/config/plugins
    curl -s https://raw.githubusercontent.com/izuolan/zresume/master/files/private.yaml -o /usr/html/user/config/plugins/private.yaml
    sed -i "s/5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8/$PASSWORD/g" /usr/html/user/config/plugins/private.yaml
fi
# start php-fpm
mkdir -p /usr/logs/php-fpm
php-fpm7

# start nginx
mkdir -p /usr/logs/nginx
mkdir -p /tmp/nginx
chown nginx /tmp/nginx
nginx
