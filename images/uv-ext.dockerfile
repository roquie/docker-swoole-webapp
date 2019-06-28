RUN git clone https://github.com/bwoebi/php-uv.git \
		&& cd php-uv \
		&& phpize \
		&& ./configure \
		&& make -j $(nproc) \
		&& make install \
		&& docker-php-ext-enable uv
