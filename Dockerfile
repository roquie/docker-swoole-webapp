FROM php:7.3-rc-cli-alpine3.8

RUN apk add --update autoconf g++ libtool make icu-dev postgresql-dev postgresql-libs libsasl db \
	&& docker-php-ext-install mbstring \
	&& docker-php-ext-install opcache \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install sockets \
    # --enable-debug-log=no --enable-sockets=yes --enable-openssl=yes, others "no" by default.
    && printf 'no\nyes\nyes' | pecl install swoole \
#    # yaml-dev
#    && echo '' | pecl install yaml \
#    && docker-php-ext-enable yaml \
    && docker-php-ext-enable swoole \
    && echo 'opcache.enable_cli=1' >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini \
    && echo 'swoole.fast_serialize=On' >> /usr/local/etc/php/conf.d/docker-php-ext-swoole-serialize.ini \
    &&  apk del \
    		autoconf \
    		bash \
    		binutils \
    		db \
    		expat \
    		file \
    		g++ \
    		gcc \
    		gdbm \
    		gmp \
    		isl \
    		libatomic \
    		libbz2 \
    		libc-dev \
    		libffi \
    		libgcc \
    		libgomp \
    		libldap \
    		libltdl \
    		libmagic \
    		libsasl \
    		libstdc++ \
    		libtool \
    		m4 \
    		make \
    		mpc1 \
    		mpfr3 \
    		musl-dev \
    		perl \
    		pkgconf \
    		pkgconfig \
    		python \
    		re2c \
    		readline \
    		sqlite-libs \
    		zlib-dev \
    	&& rm -rf /tmp/* && rm -rf /var/cache/apk/*

COPY --from=0 /app /app

EXPOSE 8080
WORKDIR /app
