<?php

// comment out the following two lines when deployed to production
defined('YII_DEBUG') or define('YII_DEBUG', true);// true测试环境 false
defined('YII_ENV') or define('YII_ENV', 'dev');// dev测试环境 prod

require(__DIR__ . '/../vendor/autoload.php');
require(__DIR__ . '/../vendor/yiisoft/yii2/Yii.php');

$config = require(__DIR__ . '/../config/web.php');

//(new yii\web\Application($config))->run();
$application = new yii\web\Application($config);
$application->language = 'zh-CN';

$application->run();