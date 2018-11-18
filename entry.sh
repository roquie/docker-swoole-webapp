#!/usr/bin/env sh

if [ "$PHP_OPCACHE_MAX_ACCELERATED_FILES_AUTO" = "true" ];
then
    count=$(find . -type f -print | grep php | wc -l)
    export PHP_OPCACHE_MAX_ACCELERATED_FILES=$((count + 100))
fi

# replace variables before start
smalte build --scope PHP\.* \
    /usr/local/etc/php/php.ini.tmpl:/usr/local/etc/php/php.ini

php index.php
