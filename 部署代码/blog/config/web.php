<?php

$params = require(__DIR__ . '/params.php');

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => '1111kijn',
            // 开启 csrf 验证
            'enableCsrfValidation'  => true,
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            'identityClass' => 'app\models\User',
            'enableAutoLogin' => true,
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        // 邮件配置
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',    //服务器类
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => false,    //这句一定有，false发送邮件，true只是生成邮件在runtime文件夹下，不发邮件
            'transport' => [
                'class' => 'Swift_SmtpTransport', //使用的类
                'host' => 'smtp.qq.com', //邮箱服务一地址
                'username' => '1099223026@qq.com',//邮箱地址，发送的邮箱
                'password' => 'mpmvzgnojguqhadh',  //自己填写邮箱密码(授权码)
                'port' => '465',  //服务器端口
                'encryption' => 'ssl', //加密方式
            ],
            'messageConfig'=>[
                'charset'=>'UTF-8', //编码
                'from'=>['1099223026@qq.com'=>'[点滴网]']  //邮件里面显示的邮件地址和名称
            ],
        ],
        'session'=>array(
            // 过期时间为1天
            'timeout'=>3600*24,
        ),
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => require(__DIR__ . '/db.php'),
    ],
    'params' => $params,
];

// 取消注释-开启调试工具栏
// if (YII_ENV_DEV) {
//    // configuration adjustments for 'dev' environment
//    $config['bootstrap'][] = 'debug';
//    $config['modules']['debug'] = 'yii\debug\Module';

//    $config['bootstrap'][] = 'gii';
//    $config['modules']['gii'] = 'yii\gii\Module';
// }
return $config;
