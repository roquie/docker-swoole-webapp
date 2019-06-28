RUN git clone --recursive --depth=1 https://github.com/kjdev/php-ext-brotli.git \
		&& cd php-ext-brotli \
		&& phpize && ./configure && make -j $(nproc) && make install \
		&& docker-php-ext-enable brotli
