RUN git clone https://github.com/concurrent-php/ext-async.git \
		&& cd ext-async \
		&& phpize && ./configure && make -j $(nproc) && make install \
		&& docker-php-ext-enable async
