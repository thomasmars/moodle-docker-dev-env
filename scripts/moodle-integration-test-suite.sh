#!/usr/bin/env bash

# Run commands relative from script location
cd "${0%/*}"

php ./../codechecker/moodle-plugin-ci/bin/moodle-plugin-ci phplint ./../mod/hvp
php ./../codechecker/moodle-plugin-ci/bin/moodle-plugin-ci phpcpd ./../mod/hvp
php ./../codechecker/moodle-plugin-ci/bin/moodle-plugin-ci phpmd ./../mod/hvp
php ./../codechecker/moodle-plugin-ci/bin/moodle-plugin-ci codechecker ./../mod/hvp
#php ./../codechecker/moodle-plugin-ci/bin/moodle-plugin-ci validate ./../mod/hvp
php ./../codechecker/moodle-plugin-ci/bin/moodle-plugin-ci savepoints ./../mod/hvp
