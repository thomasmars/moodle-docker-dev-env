#!/usr/bin/env bash

# Create course
docker-compose exec php bash -c "cd /var/www/html/moodle && php admin/tool/uploadcourse/cli/uploadcourse.php --mode=createnew --file=/moodleupload/newcourse.csv"
