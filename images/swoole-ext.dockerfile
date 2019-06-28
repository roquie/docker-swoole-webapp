RUN git clone https://github.com/swoole/swoole-src.git \
		&& cd swoole-src \
		&& git checkout "{{ swoole.main_version }}" \
		&& phpize && ./configure && make -j $(nproc) && make install \
		&& echo 'swoole.fast_serialize=On' >> /usr/local/etc/php/conf.d/docker-php-ext-swoole-serialize.ini \
		&& docker-php-ext-enable swoole
