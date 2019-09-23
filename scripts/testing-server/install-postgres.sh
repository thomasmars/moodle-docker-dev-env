#!/usr/bin/env bash

echo $PWD

# Install Moodle
docker-compose --project-name testingmoodle --file docker-compose.testing.yml exec php bash -c "cd /var/www/html/admin/cli && php install.php --wwwroot=http://192.168.1.127:86 --dataroot=/var/www/moodledata --dbtype=pgsql --dbhost=postgres --dbname=moodle --dbuser=moodle --dbpass=moodle --fullname=moodle --shortname=moodle --adminuser=admin --adminpass=Admin --adminemail=thomas.marstrander@joubel.com --agree-license --allow-unstable --non-interactive"

# Restore permissions
docker-compose --project-name testingmoodle --file docker-compose.testing.yml exec php bash -c "cd /var/www && chmod -R 777 html"

./scripts/testing-server/create-course.sh
