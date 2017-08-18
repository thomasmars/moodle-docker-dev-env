#!/usr/bin/env bash

# Clear cache
docker-compose exec php bash -c "cd /var/www/html && php admin/cli/purge_caches.php"
