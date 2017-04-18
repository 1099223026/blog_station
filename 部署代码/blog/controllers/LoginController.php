<?php

namespace app\controllers;

use app\models\User;
use Yii;
use app\models\LoginForm;
use yii\base\Controller;

class LoginController extends Controller
{
    public function actionIndex()
    {
        /*更改数据库中密码字段*/
//        $psd = User::find()
//            ->select( 'password' )
//            ->all();
//        for ( $i = 0; $i < count($psd); $i++ ){
//            $hashPsd = Yii::$app->getSecurity()->generatePasswordHash( $psd[ $i ][ 'password' ] );
//            // 验证密码和hash是否相同，是->保存到数据库 不是->报错
//            if ( Yii::$app->getSecurity()->validatePassword( $psd[ $i ][ 'password' ], $hashPsd ) ){
//                // hash保存到数据库
//                $count = User::updateAll( array( 'password'=> $hashPsd),
//                    'password=:psd', array(':psd'=>$psd[ $i ][ 'password' ]));
//                echo( $count );
//            } else {
//                echo 'error'.$psd[ $i ][ 'password' ];
//            }
//        }
        // 密码加密、校验
//        $password = '711909';
////        $hash = Yii::$app->security->generatePasswordHash( $password );
//        $n = User::find()->where([ 'email'=>'1028711909@qq.com' ])->select( 'password' )->one();
//        if ( Yii::$app->security->validatePassword( $password, $n->password ) ){
//            echo $password;
//        } else {
//            echo 'false';
//        }
    }
    /*配置验证码信息*/
    public function actions() {
        return [
            'captcha' =>  [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
//                'fixedVerifyCode' => substr(md5(date("Y-m-d H:i:s")),11,5),
                'transparent' => true,
                'testLimit'=>999,
                'maxLength'=>5,       // 最多生成几个字符
                'minLength'=>5,       // 最少生成几个字符
                'backColor'=>0xf1eded,//背景颜色
                'padding' => 5,//间距
                'height'=>34,//高度
                'width' => 120,  //宽度
                'foreColor'=>0xab6e6e,     //字体颜色
                'offset'=>7,        //设置字符偏移量 有效果
            ],
        ];
    }
    /*判断用户是否登录*/
    public function actionIsLogin()
    {
        $sessioin = Yii::$app->session;

        //检测用户是否登录
        if ( isset( $sessioin[ 'login'] ) && $sessioin[ 'login'][ 'userName' ] != ''){
            // 登录后
            return json_encode( 'true' );
        } else {
            // 尚未登录
            return json_encode( 'false' );
        }
    }
    /*登录验证*/
    public function actionEntry()
    {
        $model = new LoginForm();
        $res = '';

        // 用用户提交信息来填充模型的特性
//        $model->attributes = Yii::$app->post( 'LoginForm' );// 用用户输入填充模型
        $model->time = Yii::$app->request->post( 'time' );
        $model->email = Yii::$app->request->post( 'email' );
        $model->password = Yii::$app->request->post( 'password' );
        $model->verifyCode = Yii::$app->request->post( 'verify' );
        // 验证
        if ($model->validate()) {
            // 若所有输入都是有效的
            // 验证 验证码
            if ( !$this->createAction('captcha')->validate($model->verifyCode, false) ){
                $res = '验证码输入错误！！';
                return json_encode( $res );
            }
            // 验证码匹配成功之后 验证 密码
            // 根据email对比数据库中的password信息
            $result = User::find()
                ->select('password, username')
                ->where(['email'=>$model->attributes['email']])
                ->one();
            if ( isset( $result ) ){
                // email存在 开始验证密码
                if ( Yii::$app->security->validatePassword( $model->attributes['password'], $result['password'] ) ) {
                    // 登录成功后设置session
                    $session = Yii::$app->session;
                    $session['login'] = [
                        'email' => $model->email,
                        'userName' => $result['username'],
                        'image' => 'img/user-img.jpg', // 默认用户头像
                        'lifetime' => $model->time,
                    ];
                    $res = 'success';
                } else {
                    // email和password匹配失败
                    $res = '邮箱或者密码输入错误！！';
                }
            } else {
                // email和password匹配失败
                $res = '该邮箱尚未注册！！';
            }

            return json_encode( $res );
        } else {
            // 有效性验证失败：$errors 属性就是存储错误信息的数组
            $errors = $model->errors;
            var_dump( $errors ) ;
        }
    }
    /*退出登录*/
    public function actionLoginOut()
    {
        // 清除session
        $session = Yii::$app->session;
        unset( $session[ 'login' ] );
        // 随便返回一个值
        return 1;
    }
}