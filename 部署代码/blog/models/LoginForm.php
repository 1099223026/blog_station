<?php

namespace app\models;


use yii\base\Model;

class LoginForm extends Model
{
    public $password;
    public $email;
    public $time; // session保存时间
    public $verifyCode;

    /*定义验证规则*/
    public function rules()
    {
        return [
            [ [ 'password', 'email' ], 'required' ],
            [ 'password', 'string', 'length' => [6, 16]],
            [ 'email', 'string', 'length' => [3, 20]],
            [ 'email', 'email' ],
            ['verifyCode', 'required'],
//            ['verifyCode', 'captcha', 'captchaAction'=>'login/captcha'],// 后面必须加上captchaAction，否则报错
        ];
    }
    public function attributeLabels()
    {
        return [
            'email'         => '邮箱',
            'password'      => '密码',
            'verifyCode'    => '验证码',
        ];
    }
}