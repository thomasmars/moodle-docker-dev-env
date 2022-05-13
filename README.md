# moodle-docker-dev-env

Moodle development environment including H5P plugin.

## Usage

Edit moodleconfig/config.php and set your preferred `$CFG->wwwroot`.

To use http://localhost:

```
$CFG->wwwroot = 'http://localhost';
// $CFG->sslproxy = 1; // Make sure this is commented out
```

Then `docker compose up -d`


### Install moodle

Check out the desired branch/version of moodle

```
cd dockerphp/moodlegit
git checkout MOODLE_400_STABLE
```

> For Moodle 4, postgres version must be >= 10. Edit docker-compose.yml

Perform installation via the browser by visiting http://localhost


### Install and enable H5P plugin

In `docker-compose.yml` uncomment the bind mount for `./mod/hvp` for the both the `php` and `nginx` services:

```
- ./mod/hvp:/var/www/html/mod/hvp
```

Recreate containers to apply change

```
docker compose up -d
```

Visit Site Administration > General which should now give a prompt to upgrade database
as part of installing and enabling the H5P plugin.
