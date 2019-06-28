Docker Swoole WebApp Image
--------------------------

[![CircleCI](https://circleci.com/gh/roquie/docker-swoole-webapp.svg?style=svg)](https://circleci.com/gh/roquie/docker-swoole-webapp)

Simple docker image to build your applications based on Swoole PHP extension.
Tuned for maximum performance.

Versions:
* PHP 7.4, 7.3, 7.2, 7.1
* Latest Alpine
* Swoole builds from source with versions: [templates/alpine/php74.yaml](templates/alpine/php74.yaml).

Notice:
* Opcache enabled for cli. It use very aggressive caching and settings. Only for production.
* For now (28/06/2019) `composer` does not support PHP 7.4 :( 

**Every week at 00:00 on Sunday (UTC) Docker images automatically rebuilds.**

## Async

Image provides following async extensions:
* `async`, https://github.com/concurrent-php/ext-async.git 
* `eio`, https://github.com/rosmanov/pecl-eio.git 
* `uv`, https://github.com/bwoebi/php-uv.git 
* `swoole_async`, https://github.com/swoole/async-ext.git 

## Run

```bash
docker run --rm -it --init -p 8080:8080 roquie/docker-swoole-webapp
```

## How to usage

Example 1:

```Dockerfile
FROM roquie/composer-parallel
COPY . /app

RUN composer install --no-ansi --no-dev --no-interaction --no-progress --no-scripts --optimize-autoloader --ignore-platform-reqs

FROM roquie/docker-swoole-webapp
COPY --from=0 /app /app
```

Example 2:

```Dockerfile
FROM roquie/docker-swoole-webapp
COPY . /app
```

Example 3:

```Dockerfile
FROM roquie/docker-swoole-webapp

# Override default env values
ENV PHP_OPCACHE_ENABLE=0

COPY . /app
```

Project files must be contains `index.php` to start app.

## Extensions

```bash
[PHP Modules]
async
brotli
Core
ctype
curl
date
dom
eio
fileinfo
filter
ftp
gmp
hash
iconv
intl
json
libxml
mbstring
mysqlnd
openssl
pcre
PDO
pdo_mysql
pdo_pgsql
pdo_sqlite
Phar
posix
readline
Reflection
session
SimpleXML
sockets
sodium
SPL
sqlite3
standard
swoole
swoole_async
tokenizer
xml
xmlreader
xmlwriter
yaml
Zend OPcache
zlib

[Zend Modules]
Zend OPcache

```

## Env variables

```bash
ENTRY_SCRIPT /app/index.php

PHP_MEMORY_LIMIT=-1
PHP_MAX_EXECUTION_TIME=120 # seconds
PHP_MAX_INPUT_TIME=60 # seconds
PHP_ERROR_REPORTING="E_ALL & ~E_DEPRECATED & ~E_STRICT"
PHP_DISPLAY_ERRORS=Off
PHP_POST_MAX_SIZE=512M
PHP_UPLOAD_MAX_FILESIZE=512M
PHP_MAX_FILE_UPLOADS=20
PHP_DEFAULT_MIMETYPE=application/json
PHP_SESSION_STRICT_MODE=1
PHP_SESSION_COOKIE_SECURE=1
PHP_EXPOSE_PHP=Off
PHP_DATE_TIMEZONE=UTC
PHP_SHORT_OPEN_TAG=Off
PHP_ASYNC_THREADS=auto

PHP_OPCACHE_ENABLE=1
PHP_OPCACHE_ENABLE_CLI=1
PHP_OPCACHE_MEMORY_CONSUMPTION=512
PHP_OPCACHE_INTERNED_STRINGS_BUFFER=16
PHP_OPCACHE_MAX_ACCELERATED_FILES_AUTO=true
PHP_OPCACHE_MAX_ACCELERATED_FILES=50000 # if PHP_OPCACHE_MAX_ACCELERATED_FILES_AUTO is `true`, files count automatically.
PHP_OPCACHE_REVALIDATE_FREQ=0
PHP_OPCACHE_ENABLE_FILE_OVERRIDE=1
PHP_OPCACHE_FILE_CACHE_ONLY=1
```

## Tags

* latest (PHP 7.3)
* 7.4-latest
* 7.3-latest
* 7.2-latest
* 7.1-latest

## License

MIT License

Copyright (c) 2019 roquie0@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

