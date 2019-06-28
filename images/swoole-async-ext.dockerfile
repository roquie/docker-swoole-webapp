RUN git clone https://github.com/swoole/async-ext.git \
		&& cd async-ext \
		&& git checkout "{{ swoole.async_version }}" \
		&& phpize && ./configure && make -j $(nproc) && make install \
		&& docker-php-ext-enable swoole_async
