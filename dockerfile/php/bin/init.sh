#!/bin/bash

cd /var/www/html

if [ -d "/var/www/html" ] && [ "$(ls -A /var/www/html)" ]; then
  printenv
  npm install
  composer install
  chmod -R 777 /var/www/html/storage
  chown -R nginx:nginx /var/www/html/storage
  php artisan route:clear
  php artisan cache:clear
  php artisan config:clear
  php artisan migrate --force
fi

exec php-fpm