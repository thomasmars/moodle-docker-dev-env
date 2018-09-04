#!/usr/bin/env bash

docker-compose exec php bash -c "php ../mpc/bin/moodle-plugin-ci phplint ./mod/hvp"
docker-compose exec php bash -c "php ../mpc/bin/moodle-plugin-ci phpcpd ./mod/hvp"
docker-compose exec php bash -c "php ../mpc/bin/moodle-plugin-ci phpmd ./mod/hvp"
docker-compose exec php bash -c "php ../mpc/bin/moodle-plugin-ci codechecker ./mod/hvp"
docker-compose exec php bash -c "php ../mpc/bin/moodle-plugin-ci validate ./mod/hvp"
docker-compose exec php bash -c "php ../mpc/bin/moodle-plugin-ci savepoints ./mod/hvp"
docker-compose exec php bash -c "php ../mpc/bin/moodle-plugin-ci mustache ./mod/hvp"
docker-compose exec php bash -c "php ../mpc/bin/moodle-plugin-ci phpunit ./mod/hvp"
