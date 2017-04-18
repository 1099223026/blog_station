<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/1/24
 * Time: 16:55
 */

namespace app\models;



use yii\base\Model;
/*注册*/
class SignUpForm extends Model
{
    public $userName;
    public $email;
    public $first_psd;
    public $second_psd;
    public $verifyCode;
    public $url;

    /*定义验证规则*/
    public function rules()
    {
        return [
            [ [ 'userName', 'email', 'first_psd', 'second_psd', 'verifyCode' ], 'required' ],
            [ [ 'first_psd', 'second_psd' ],'string', 'length' => [ 6, 16 ] ],
            [ 'email', 'email' ],
            ['second_psd', 'compare', 'compareAttribute'=>'first_psd', 'message'=>'两次密码必须输入一致。' ],// 两次密码输入一直校验
//            ['verifyCode', 'captcha', 'captchaAction'=>'sign-up/captcha'],// 后面必须加上captchaAction，否则报错
        ];
    }
    public function attributeLabels()
    {
        return[
            'userName'      => '用户名',
            'email'         => '邮箱',
            'first_psd'     => '密码',
            'second_psd'    => '密码',
            'verifyCode'    => '验证码',
        ];
    }
}