<?php
require_once '../libweibo-master/saetv2.ex.class.php';
require_once 'config.php';
// 开启session会话即可解决session不显示（或者说未保存）---之前找错了很久
session_start();
// echo $_GET['code'];

$o = new SaeTOAuthV2(WB_KEY, WB_SEC);
// 获取accesstoken
$key = array(
	'code' => $_GET['code'],
	'redirect_uri' => CALLBACK_URL
	);
$accesstoken = $o->getAccessToken($key);
// 如果获取到的令牌过期了，用refresh_token去换取新的令牌
// 用获取到的accetoken（令牌）去调用接口
setcookie('accesstoken', $accesstoken['access_token'], time()+86400);

$c = new saetclientv2( WB_KEY, WB_SEC, $accesstoken['access_token'] );
// 获取uid
$uid_get = $c->get_uid();
$uid = $uid_get['uid'];

// 根据uid获取用户信息
$user_info=$c->show_user_by_id( $uid ); //微博sdk方法获取用户的信息
//var_dump( $user_info );
//$userName = $user_info[ 'screen_name' ];
//$image = $user_info[ 'profile_image_url' ];
// 保存登录信息
$_SESSION['login'] = [
    'email' => '',
    'userName' => $user_info[ 'screen_name' ],
    'image' => $user_info[ 'profile_image_url' ],
    'lifetime' => 86400, // 1天
];
// 返回cookie表示登录成功 作用于为全局，否则无法识别
setcookie( 'auth', true, time()+86400, '/' );

// 关闭第三方登录页面
echo "<script>window.close()</script>";
?>