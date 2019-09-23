#!/usr/bin/env bash

# Create course
docker-compose --project-name testingmoodle --file docker-compose.testing.yml exec php bash -c "cd /var/www/html && php admin/tool/uploadcourse/cli/uploadcourse.php --mode=createnew --file=/moodleupload/newcourse.csv"
