RUN git clone https://github.com/rosmanov/pecl-eio.git \
		&& cd pecl-eio \
		&& phpize \
		&& ./configure --with-eio --enable-eio-sockets \
		&& make -j $(nproc) \
		&& make install \
		&& docker-php-ext-enable eio
