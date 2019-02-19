<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();
$CFG->dbname    = 'moodle';
$CFG->dbuser    = 'moodle';
$CFG->dbpass    = 'moodle';

$CFG->prefix    = 'mdl_';
// Start mariadb

//$CFG->dboptions = array (
//  'dbpersist' => 0,
//  'dbport' => '',
//  'dbsocket' => '',
//  'dbcollation' => 'utf8mb4_unicode_ci',
//);
//$CFG->dbtype    = 'mariadb';
//$CFG->dblibrary = 'native';
//$CFG->dbhost    = 'mariadb';

// End mariadb


// Start postgres

$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => '',
  'dbsocket' => '',
);
$CFG->dbtype    = 'pgsql';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'postgres';

// End postgres


//$CFG->wwwroot   = 'http://localhost';
$CFG->wwwroot   = 'http://192.168.1.127';
$CFG->dataroot  = '/var/www/moodledata';
$CFG->admin     = 'admin';

$CFG->directorypermissions = 02777;

//define('MDL_PERF', false);
//define('MDL_PERFDB', false);
//define('MDL_PERFTOLOG', false);
//define('MDL_PERFTOFOOT', false);

// H5P Specific
$CFG->mod_hvp_backup_libraries = '0';

//=========================================================================
// 7. SETTINGS FOR DEVELOPMENT SERVERS - not intended for production use!!!
//=========================================================================
//
// Force a debugging mode regardless the settings in the site administration
@error_reporting(E_ALL);   // NOT FOR PRODUCTION SERVERS!
@ini_set('display_errors', '1');         // NOT FOR PRODUCTION SERVERS!
$CFG->debug = (E_ALL);   // === DEBUG_DEVELOPER - NOT FOR PRODUCTION SERVERS!
$CFG->debugdisplay = 1;              // NOT FOR PRODUCTION SERVERS!
//
// You can specify a comma separated list of user ids that that always see
// debug messages, this overrides the debug flag in $CFG->debug and $CFG->debugdisplay
// for these users only.
//$CFG->debugusers = '2';

require_once(__DIR__ . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!


