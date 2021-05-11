#!/bin/bash

systemctl restart httpd
echo "Changing permissions"

chown -R apache:apache /var/www/html/example-app

echo "starting the composer install"
cd /var/www/html/example-app
composer install

echo "Generating keys"
php artisan key:generate

echo "Migrating DB"
php artisan session:table
php artisan migrate

echo "Doing something"
php artisan db:seed
