<?php

return [
    'autoload' => false,
    'hooks' => [
        'app_init' => [
            0 => 'epay',
        ],
    ],
    'route' => [
        '/qrcode$' => 'qrcode/index/index',
        '/qrcode/build$' => 'qrcode/index/build',
    ],
    'service' => [
    ],
];