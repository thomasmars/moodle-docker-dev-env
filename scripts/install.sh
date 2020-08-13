#!/usr/bin/env bash

# Install Moodle
docker-compose exec php bash -c "cd /var/www/html/admin/cli && php install.php --wwwroot=http://localhost --dataroot=/var/www/moodledata --dbtype=mariadb --dbhost=mariadb --dbname=moodle --dbuser=moodle --dbpass=moodle --fullname=moodle --shortname=moodle --adminuser=admin --adminpass=Admin --adminemail=thomas.marstrander@joubel.com --agree-license --allow-unstable --non-interactive"

# Restore permissions
docker-compose exec php bash -c "cd /var/www && chmod -R 777 html"

./scripts/create-course.sh
