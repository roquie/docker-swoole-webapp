<?php

assert(opcache_get_status()['opcache_enabled']);
assert(extension_loaded('swoole'));
assert(extension_loaded('swoole_async'));
assert(extension_loaded('eio'));
assert(extension_loaded('brotli'));
assert(extension_loaded('yaml'));
assert(extension_loaded('intl'));
assert(extension_loaded('pdo_pgsql'));
assert(extension_loaded('pdo_mysql'));
assert(extension_loaded('sockets'));
assert(extension_loaded('gmp'));
assert(extension_loaded('async'));
assert(extension_loaded('uv'));
