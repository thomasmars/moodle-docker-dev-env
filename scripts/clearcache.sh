#!/usr/bin/env bash

# Clear cache
docker-compose exec php bash -c "cd /var/www/html/admin/cli && php purge_caches.php"
