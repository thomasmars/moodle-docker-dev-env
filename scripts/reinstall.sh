#!/usr/bin/env bash

docker-compose down -v

docker-compose up -d

sleep 15

./scripts/install-postgres.sh
#./scripts/install.sh
