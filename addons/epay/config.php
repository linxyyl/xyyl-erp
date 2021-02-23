<?php

return [
    0 => [
        'name' => 'wechat',
        'title' => '微信',
        'type' => 'array',
        'content' => [
        ],
        'value' => [
            'appid' => '',
            'app_id' => '',
            'app_secret' => '',
            'miniapp_id' => '',
            'mch_id' => '',
            'key' => '',
            'notify_url' => '/addons/epay/api/notifyx/type/wechat',
            'cert_client' => '/epay/certs/apiclient_cert.pem',
            'cert_key' => '/epay/certs/apiclient_key.pem',
            'log' => 1,
        ],
        'rule' => '',
        'msg' => '',
        'tip' => '微信参数配置',
        'ok' => '',
        'extend' => '',
    ],
    2 => [
        'name' => 'alipay',
        'title' => '支付宝',
        'type' => 'array',
        'content' => [
        ],
        'value' => [
            'app_id' => '2019110768936963',
            'notify_url' => '/addons/epay/api/notifyx/type/alipay',
            'return_url' => '/addons/epay/api/returnx/type/alipay',
            'ali_public_key' => '/epay/certs/alipayCertPublicKey_RSA2.crt',
            'private_key' => 'MIIEowIBAAKCAQEAlbjim/aLeIxBWlHDhaFuExck4u0zSM1ar4ZxkQ2SwBXgymptgBVQFZ9672tYP0iH1lE9o4Zp1hHSPevqvrGFUZlKchXuanmGx9lRJat51Kiqis5xrix9so+DDfChdlQJWEMWxA8Ek0CyA6pnoQ9tEqI0Hn4MhQkcDQvVZcio6CPMMnFOZbwKCOILW/6q6MMMpiPSnjbMr+WcvqQAdy6lffpzWPWoQ2KuCeFH9gtolgLsZxRKWbROkhBl04m6Ehv+lU5PBnJBLZaIsA54zBNF7qJ1qWe6lvTR0OyqPZnvKhag5eoQKG614PoO6eEs8TQsqpBD7AlN/85n00xiWTBtHQIDAQABAoIBAGTS5V9Lzq42HQhaiUVi6UJX0pIyU9fR2iDbc3zP3CQYV5FXzDd1osF87QdvjTTIfhkYCl8lc/4hcCgcx6700qeZh+V92VjAT8AjGx8380n+7yGcVjeJZHgrZoCrq7+IZeaW/yy2REl5RqdrSG/QeI4Uxu5Fyd6IvOgYMPNjBkOUV0a7Vk9WEZm6o5iddotP+tXDEEGthr7ZoLhQZHHj3ymnlepJDf/1b29rrRXf1j5dsSKlO/fIsmANh1+na59QXlaUHyq32z+QX90yEjxFqM39r/ujobysTUAgDk+tTSia+3kvwWqZUUjIrCF7Ly9PnKgiaMT6F4VX15MkiIz8xo0CgYEA03SbehRdODHBFZDi6l8U0HMYdnj1nMgXQRw0cpuhV2C/H1XBke4BD6D/X5T/kIvoaYDMK6yfxDT0zZcWmFjHLTslE5dW3Ad37xgh3tcejs7hnahRrEqippmSKjaXkJERPh1cbj0xoPhzdEMkDtcj60sxGoKlJ5Lq95qsLcql0zcCgYEAtUMedv+5XMRcvV53vOP4b6oLlggdCnROpcdbMfw+Gk+0Y+O/KXPPGo5WKsySxafyA5uwZP9LdcjSEaj4Lfn5SpeDCJGtwdu0iFs+eCAf/NsMLUuKKk1InZdG7Rq0Z2pOvwe3FhMnhvLOBynEi1qpIy6AOdwuWKCfT2sqjXLe1EsCgYAcMkllLv/7NU888/P+Mq2Q2jgh3CFMRbYsHXm06qHKCAGUSRglwGntzpcfBLxLZwyXvO/8xukK/dDC9Wmy6OuuUVuxUBXqAyjv/fTORTsy6c1V+5LgeZdUxdeiv2LYiS+Wa83eeVR71YV3tFhDjlag0ob6tP8W1tV0LPDWrlYMYwKBgQCCKUl2IFomMGd8IJsRDA85eD1LplXcTPqw9sAY285orHWYCVIbXSsKIc3ke/SldN1IFAON8vloAiY/Qju9IDUQiE4y2BGTFMbF5+eq8T6nH1DWMdlsWQTdDWWEG9oSLPeRG+QwON74e+DQqgCWJSsxtVGkuuSZBfaAXC85VZSHkwKBgA0OY1V3v7ftczZo4Ghh5zXcGASXb4XZ9z1eFSonFFIsDGrl6dk/jDAd4X1i5H1Rz7p0niqiC1hbmU23kd/8Uymu6kvCbHXz/JclfJKp3cCzh6fa1vaMVQBZrrh0bBRJcH7gkbe1J2+30WsQPfAVgi5W64RwN0WwxpUvXV34hKzd',
            'app_cert_public_key' => '/epay/certs/appCertPublicKey.crt',
            'alipay_root_cert' => '/epay/certs/alipayRootCert.crt',
            'log' => '1',
        ],
        'rule' => 'required',
        'msg' => '',
        'tip' => '支付宝参数配置',
        'ok' => '',
        'extend' => '',
    ],
    3 => [
        'name' => '__tips__',
        'title' => '温馨提示',
        'type' => 'array',
        'content' => [
        ],
        'value' => '请注意微信支付证书路径位于/addons/epay/certs目录下，请替换成你自己的证书<br>appid：APP的appid<br>app_id：公众号的appid<br>app_secret：公众号的secret<br>miniapp_id：小程序ID<br>mch_id：微信商户ID<br>key：微信商户支付的密钥<br>支付宝<br>使用公钥证书模式，请修改ali_public_key为以.crt结尾的支付宝公钥证书路径，如（/addons/epay/certs/alipayCertPublicKey_RSA2.crt）',
        'rule' => '',
        'msg' => '',
        'tip' => '微信参数配置',
        'ok' => '',
        'extend' => '',
    ],
];
