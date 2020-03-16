#!/usr/bin/env bash

docker-compose --project-name testingmoodle --file docker-compose.testing.yml logs --tail=20 -f php
