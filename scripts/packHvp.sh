#!/usr/bin/env bash

if [ "$1" != "" ]; then
    moodleVersion=$1
    echo "what is $1"
else
    echo "You must provide a moodle version number"
    exit 1
fi

cd mod
pluginVersion=$(grep '$plugin->version' hvp/version.php | awk -F"= " '{print substr($2, 1, length($2)-1)}')

packageVersion=mod_hvp_moodle"$moodleVersion"_"$pluginVersion"
zip -r "$packageVersion".zip hvp -x *.git -x *.sass-cache*
echo "Successfully packaged $packageVersion"
