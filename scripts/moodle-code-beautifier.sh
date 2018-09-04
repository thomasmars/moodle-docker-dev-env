#!/usr/bin/env bash

docker-compose exec php bash -c "php ../mpc/bin/moodle-plugin-ci phpcbf ./mod/hvp"
