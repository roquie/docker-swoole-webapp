Docker Swoole WebApp Image
--------------------------

[![CircleCI](https://circleci.com/gh/roquie/docker-swoole-webapp.svg?style=svg)](https://circleci.com/gh/roquie/docker-swoole-webapp)

Simple docker image to build your applications based on Swoole PHP extension.

Versions:
* PHP 7.3
* Alpine 3.8
* Swoole latest (4.5)

Notice:
* Opcache enabled for cli
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

CMD ["php", "index.php"]
```

Example 2:

```Dockerfile
FROM roquie/docker-swoole-webapp
COPY . /app

CMD ["php", "index.php"]
```

## Tags

* latest (PHP 7.3)
* 7.3-latest
* 7.2-latest
* 7.1-latest

## License

MIT.

