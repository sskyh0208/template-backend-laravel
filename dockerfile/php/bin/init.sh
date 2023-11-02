#!/bin/bash

cd /var/www/html

if [ -d "/var/www/html" ] && [ "$(ls -A /var/www/html)" ]; then
  npm install
  composer install
  chown -R www-data:www-data /var/www/html/storage
fi

cd _

exec php-fpm