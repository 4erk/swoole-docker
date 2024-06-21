<?php

require 'vendor/autoload.php';

use Swoole\Http\Server;

$host = getenv('HOST');
$port = getenv('PORT');
$env = getenv('ENV');

$server = new Server($host, $port);

$server->on("start", function ($server) {
    echo "Swoole HTTP server is started at http://{$server->host}:{$server->port}\n";
});

$server->on("request", function ($request, $response) use ($env) {
    $response->header("Content-Type", "text/plain");
    $response->end("Hello, World!" . $env);
});

$server->start();