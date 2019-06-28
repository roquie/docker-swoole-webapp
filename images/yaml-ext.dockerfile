RUN git clone https://github.com/php/pecl-file_formats-yaml.git \
		&& cd pecl-file_formats-yaml \
		&& phpize && ./configure && make -j $(nproc) && make install \
		&& docker-php-ext-enable yaml
