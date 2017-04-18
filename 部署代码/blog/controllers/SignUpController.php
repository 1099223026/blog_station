<?php
namespace app\controllers;


use app\models\SignUpForm;
use app\models\User;
use yii\base\Controller;
use yii;

class SignUpController extends Controller
{
    // 测试
    public function actionTest()
    {
        // 获取当前客户机的ip地址
//        $ip = Yii::$app->request->userIP;
//        echo $ip;

        // 创建数据表
//        $mir = new yii\db\Migration();
//        $sch = new yii\db\mysql\Schema();
//        $mir->createTable( 'tab_login_log', [
//            'id' => $sch::TYPE_PK,
//            'action_date' => $sch::TYPE_DATETIME.' not null',
//            'client_ip' => $sch::TYPE_STRING.' not null',
//            'email' => $sch::TYPE_STRING.' not null'
//        ]);
        // 创建测试事务
        $db = Yii::$app->db;
        $tr = $db->beginTransaction();
        try{
            $sql = 'select * from tab_login_log';
            $command = $db->createCommand( $sql );
            $res = $command->queryAll();
            // 提交
            $tr->commit();
            var_dump( $res );
        } catch ( yii\base\Exception $e ) {
            // 回滚
            $tr->rollBack();
            echo 'rollback';
        }
    }
    // 邮箱验证成功
    public function actionSuccess()
    {
        $this->layout = false;
        return $this->render( 'success' );
    }
    // 邮箱验证失败
    public function actionError()
    {
        $this->layout = false;
        return $this->render( 'error' );
    }
    // 邮箱验证地址
    public function actionVerifyMessage()
    {
        // 更换域名是应该更改发送的邮件内的域名
        $pid = Yii::$app->request->get( 'pid' );
        $res = '';
        // 比对cookie信息 未过期就保存
        $cookie = Yii::$app->request->cookies;
        $email = $cookie->getValue( 'email'.$pid );
        if ( isset( $email ) ){
            // 未过期
            $password = $cookie->getValue( 'password'.$pid );
            $userName = $cookie->getValue( 'userName'.$pid );
            $user = new User();
            $user->username = $userName;
            $user->email = $email;
            $user->password = $password;
            $user->isadmini = '0';
            // 插入到数据库
            $count = $user->insert();
            if ( $count == 1 ){
                // 插入成功
                $res = 'success';
                // 清除cookie
                $cookie = Yii::$app->response->cookies;
                unset($cookie[ 'email'.$pid ]);
                unset($cookie[ 'password'.$pid ]);
                unset($cookie[ 'userName'.$pid ]);
            } else {
                // 插入失败
                $res = '插入到数据库出错！！';
            }
            // 跳转到成功行为
            return $this->actionSuccess();
        } else {
            // 已经过期
            // 跳转到失败行为
            return $this->actionError();
        }
    }
    // 激活邮箱页面
    public function actionIndex()
    {
        $pid = Yii::$app->request->get( 'pid' );
        // 清除布局文件
        $this->layout = false;
        $model = new SignUpForm();
        // 获取保存的cookie
        $cookie = Yii::$app->request->cookies;
        $email = $cookie->getValue( 'email'.$pid );
        // 发送邮件
        $res = $this->actionSendEmail( $email, $pid );
        $sign = '';
        // 发送成功
        if ( $res == 'success' ){$sign = 'show';}
        else{$sign = 'hidden';}
        // 为前台设置值(去空格)
        $model->email = trim( $email );
        // 截取@后面的字符串
        $email = substr( strstr( $model->email, '@' ),1 );
        // 邮箱大全
        $mail = [
            'qq.com' => 'https://mail.qq.com',
            '163.com' => 'http://mail.163.com/',
            '139.com' => 'http://mail.10086.cn/',
            'sohu.com' => 'http://mail.sohu.com/',
            '189.cn' => 'http://webmail30.189.cn/',
            '126.com' => 'http://www.126.com/',
            'sina.com' => 'http://mail.sina.com.cn/',
            'aliyun.com' => 'https://mail.aliyun.com/',
            'yeah.net' => 'http://www.yeah.net/',
        ];
        // 在mail中查找对应邮箱
        $len = count( $mail );
        for ( $i = 0; $i < $len; $i++ ){
            if ( array_keys( $mail )[ $i ] == $email ){
                $model->url = $mail[ array_keys( $mail )[ $i ] ];
            }
        }
        return $this->render( 'index', [ 'model'=>$model, 'sign'=>$sign ] );
    }
    /*发送邮件*/
    public function actionSendEmail( $email = '', $pid = '' )
    {
        // 获取当前域名
        $hostInfo = Yii::$app->request->hostInfo;
        // 获取当前时间
        $time = date( 'Y-m-d', time());
        $mail = Yii::$app->mailer->compose()
            ->setTo( $email )
            ->setSubject( "[点滴网]帐号注册激活邮件")
            ->setHtmlBody("
                <body style=\"normal 14px \"Microsoft YaHei\",\"微软雅黑\",\"宋体\",helvetica,\"Hiragino Sans GB\"\">
                    <p style='font-weight: 800;'><span>亲爱的 </span><a href=\"\">".$email."</a>：</p>
                    <br>
                    <p>感谢您申请注册网易账号! 请点击链接完成注册：</p>
                    <a href='".$hostInfo."/web/index.php?r=sign-up/verify-message&pid=".$pid."'>点击验证</a>
                    <br><br>
                    <p>如果上述文字点击无效，请把下面网页地址复制到浏览器地址栏中打开：</p>
                    <a href='".$hostInfo."/web/index.php?r=sign-up/verify-message&pid=".$pid."'>
                    ".$hostInfo."/web/index.php?r=sign-up/verify-message&pid=".$pid."</a>
                    <br><br>
                    <p style=\"color:#e67e22\">（请在48小时内完成验证，否则您需要重新注册）</p>
                    <br>
                    <p>如果您没有申请注册点滴网账号，请忽略此邮件。</p>
                    <br/>
                    <hr/>
                    <p>".$time."</p>
                    <p>这是一封机器人发出的邮件，请不要回复</p>
                </body>
            ")
            ->send();
        if ( $mail ){
            // 邮件发送成功
            return 'success';
        } else {
            // 邮件发送失败
            echo 'fail';
        }
    }
    // 验证码配置
    public function actions()
    {
        return [
            'captcha' =>  [
                'class' => 'yii\captcha\CaptchaAction',
//                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
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
    /*注册验证*/
    public function actionEntry()
    {
        $model = new SignUpForm();
        $res = '';
        // 用用户提交信息来填充模型的特性
//        $model->attributes = Yii::$app->post( 'LoginForm' );// 用用户输入填充模型
        $model->userName = Yii::$app->request->post( 'userName' );
        $model->email = Yii::$app->request->post( 'email' );
        $model->first_psd = Yii::$app->request->post( 'password' );
        $model->second_psd = Yii::$app->request->post( 'password2' );
        $model->verifyCode = Yii::$app->request->post( 'verify' );
        // 验证
        if ($model->validate()) {
            // 若所有输入都是有效的
            // 验证 验证码
            if ( !$this->createAction('captcha')->validate($model->verifyCode, false) ){
                $res = '验证码输入错误！！';
                return json_encode( $res );
            }
            // 验证码匹配成功之后 判断两次输入密码是否一致（前台验证处理过一次）
            if( $model->second_psd == $model->first_psd ){
                // 判断邮箱是否已经注册 是->返回信息 否->继续
                $email_result = User::find()
                    ->select( 'email' )
                    ->where( 'email=:email', [ ':email'=>$model->email ] )
                    ->one();
                // 查找邮箱是否存在
                if ( empty( $email_result ) ){
                    // 不存在
                    $result = User::find()
                        ->select( 'username' )
                        ->where( 'username=:username', [ ':username'=> $model->userName ] )
                        ->one();
                    // 查找用户名是否存在
                    if( empty($result) ){
                        // 不存在 将提交的信息保存到cookie中以便用户验证
                        // pid随机数
                        $pid=$this->random(10);
                        // 密码hash加密处理
                        $hash_password = Yii::$app->getSecurity()->generatePasswordHash( $model->first_psd );
                        $cookie = Yii::$app->response->cookies;
                        // name加上pid解决了一台机器只能同时注册一个账号的缺陷
                        $cookie->add( new yii\web\Cookie( [
                            'name'      => 'userName'.$pid,
                            'value' => $model->userName,
                            'expire'    => time() + 3600 * 24 * 2,// 保存2天
                        ]));
                        $cookie->add( new yii\web\Cookie( [
                            'name'      => 'password'.$pid,
                            'value' => $hash_password,
                            'expire'    => time() + 3600 * 24 * 2,// 保存2天
                        ]));
                        $cookie->add( new yii\web\Cookie( [
                            'name'      => 'email'.$pid,
                            'value' => $model->email,
                            'expire'    => time() + 3600 * 24 * 2,// 保存2天
                        ]));
                        // 返回success信息
                        $res[ 0 ] = 'success';
                        $res[ 1 ] = $pid; //这是唯一一处出现$res[1]这个下标的
                        return json_encode( $res );
                    } else {
                        // 存在 返回错误信息
                        $res[ 0 ] = '用户名已经存在，请更换用户名！！';
                        return json_encode( $res );
                    }
                } else {
                    // 存在
                    $res[ 0 ] = '邮箱已经被注册！！';
                    return json_encode( $res );
                }
            }
        } else {
            // 有效性验证失败：$errors 属性就是存储错误信息的数组
            $errors = $model->errors;
            var_dump( $errors ) ;
        }
    }
    /**
     * 产生随机字符串
     *
     * @param    int        $length  输出长度
     * @param    string     $chars   可选的 ，默认为 0123456789
     * @return   string     字符串
     */
    public function random($length, $chars = '0123456789abcdefghijklmnpqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ') {
        $hash = '';
        $max = strlen($chars) - 1;
        for($i = 0; $i < $length; $i++) {
            $hash .= $chars[mt_rand(0, $max)];
        }
        return $hash;
    }
}