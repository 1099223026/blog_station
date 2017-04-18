<?php

namespace app\controllers;

use app\models\LoginForm;
use app\models\Message;
use app\models\SignUpForm;
use app\models\User;
use yii\base\Controller;
use app\models\BoardForm;
use Yii;
class MessageBoardController extends Controller
{
    // 留言板页面
    public function actionIndex(){
        // 屏蔽布局文件
        $this->layout = 'main';
        // 加载utf-8文档头
        header( 'Content-type:text/html;charset=utf-8');

        // 发送到页面进行留言输入验证
        $model = new BoardForm();
        // 发送给页面，进行登录验证
        $loginModel = new LoginForm();
        // 进行注册验证
        $signUpModel = new SignUpForm();

        // 访问数据库 获取留言信息
        $res = Message::find()
            ->select( 'userName, content, thumb, time, headImg' );
        // 进行分页 返回结果的date['model']是查询结果 data['pages']是分页对象
        $data = TraitController::paging( $res, 'time' );

        // 对象转为数组 conData['amount']不需要转换
        $fruit = TraitController::arrObjToArrTwo( $data[ 'model' ] );
        // 过滤对象转数组产生的 null 值
//        $fruit = TraitController::filterNullTwo( $fruit );
//        var_dump( $fruit );
        return $this->render( 'message-board',
            [
                'messageModel' => $model,
                'loginModel' => $loginModel,
                'signUpModel'=>$signUpModel,
                'fruit' => $fruit,
                'page' => $data[ 'pages' ],
            ]
        );
    }
    public function actionTest()
    {
        echo Yii::$app->request->hostInfo;
    }

    // 登录验证，登录控制器中有该验证，当前这个已经过时了
//    public function actionEntry()
//    {
//        $model = new LoginForm();
//        $messageModel = new BoardForm();
//
//        // 用用户输入来填充模型的特性
//        $model->attributes = Yii::$app->request->post( 'LoginForm' );
//        if ($model->validate()) {
//            // 若所有输入都是有效的
//            // 根据email对比数据库中的password信息
//            $result = User::find()->select('password, username')->where(['email'=>$model->attributes['email']])->one();
//
//            // email不存在
//            if ( $result == null ){
////                echo 'email不存在';
//            } else if( $result['password'] == $model->attributes['password'] ){
//                Yii::$app->user->setFlash('success','操作成功');
//                echo Yii::$app->user->getFlash('success');
//                // email和password匹配正确
//                // 设置session的过期时间
//                $time = 3600 * 24;
//                $status = $model->attributes['status'];
//                // 勾选保存10天
//                if ( $status ){
//                    $time = 3600 * 24 * 10;
//                }
//                // 登录成功后设置session
//                $session = Yii::$app->session;
//                $session[ 'login' ] = [
//                    'email' => $model->attributes['email'],
//                    'userName' => $result[ 'username' ],
//                    'lifetime' => $time,
//                ];
//                return $this->render( 'message-board.php',
//                    ['loginModel'=>$model, 'messageModel'=>$messageModel ] );
//            } else{
//                // 密码不同
//            }
//
//        } else {
//            // 有效性验证失败：$errors 属性就是存储错误信息的数组
//            $errors = $model->errors;
//            var_dump( $errors ) ;
//        }
//    }
    // 点赞数控制器
    public function actionThumbPost(){
        // 接收前台post来的 点赞数 和 下标
        $request    = Yii::$app->request;
        $thumbNum   = $request->post( 'thumbNum' );
        $userName   = $request->post( 'userName' );
        $time       = $request->post( 'time' );
        $sign       = $request->post( 'sign' );

        // 不需要计算点赞数，直接在前台页面中获取
        // 根据获取的参数改变数据库中点赞数值
        $customer = Message::find()
            ->where([ 'userName' => $userName, 'time' => $time ])
            ->one();
        $customer->thumb = $thumbNum;
        $res = $customer->save();
        // 返回从数据库获取到的点赞数到前台
        return json_encode( $res );
    }
    // 提交留言板内容
    public function actionBoardContentPost()
    {
        // 获取 model
        $model = new BoardForm();

        // 通过rules验证数据是否合法
        if ( $model->validate() ) {
            // 验证成功
            // 获取前台提交数据
            $request    = Yii::$app->request;
            $message    = $request->post( 'message' );
            $img        = $request->post( 'img' );
            // 获取session中保存的用户名
            $session    = Yii::$app->session;
            $userName   = $session[ 'login' ][ 'userName' ];
            // 获取当前时间
            $time       = date( "Y-m-d H:i:s", time() );
            // 点赞数默认为0
            $num = 0;

            // 保存至数据库
            // 装载数据
            $mes            = new Message();
            $mes->content   = $message;
            $mes->userName  = $userName;
            $mes->thumb     = $num;
            $mes->time      = $time;
            $mes->headImg   = $img;
            $count          = $mes->insert();
            // 将执行结果返回到前台，让它接着处理
            return json_encode($count);
        } else{
            // 验证失败
            echo 'boardForm check error!!';
            exit;
        }
    }
}