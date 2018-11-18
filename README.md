Docker Swoole WebApp Image
--------------------------

[![CircleCI](https://circleci.com/gh/roquie/docker-swoole-webapp.svg?style=svg)](https://circleci.com/gh/roquie/docker-swoole-webapp)

Simple docker image to build your applications based on Swoole PHP extension.
Tuned for maximum performance.

Versions:
* PHP 7.3
* Alpine 3.8
* Swoole latest (4.5)

Notice:
* Opcache enabled for cli. It use very aggressive caching and settings. Only for production.
* Swoole fast serialize is enabled too.

**Every week at 00:00 on Sunday (UTC) Docker images automatically rebuilds.**

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

Project files must be contains `index.php` to start app.

## Extensions

* mbstring
* opcache
* intl
* pdo_pgsql
* pdo_mysql
* sockets
* gmp
* swoole

## Env variables

```bash
PHP_MEMORY_LIMIT=1024mb
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
* 7.3-latest
* 7.2-latest
* 7.1-latest

## License

MIT.

