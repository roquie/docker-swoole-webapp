<?php

use Swoole\Http\Response;
use Swoole\Http\Server;

$http = new Server('0.0.0.0', 8080, SWOOLE_PROCESS);

$http->set([
    'worker_num' => 4,
]);

$http->on('request', function ($request, Response $response)  {
    $response->end('Hello world!');
});

$http->start();
