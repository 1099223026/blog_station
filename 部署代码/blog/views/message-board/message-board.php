<?php
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;
use app\assets\AppAsset;
// 自动加载资源(js)
AppAsset::register( $this );
?>
<head>
    <?php echo Html::cssFile( '@web/css/message_board.css' ); ?>
    <!-- 导入js资源 -->
    <?php echo AppAsset::addPageScript( $this, '@web/assets/44a118f3/js/bootstrap.min.js' ); ?>
    <script type="text/javascript" color="255,0,0" opacity="0.5" count="99" src="js/canvas-nest.js"></script>
</head>
<body>
    <!-- 模态框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bdr-radius-clear">
            <div class="modal-header bdr-clear">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
            </div>
            <div class="modal-body">
                <!--登录框-->
                <?php $form = ActiveForm::begin(); ?>
                <div id="login-box" class="col-md-8 login-box">
                    <h4 class="text-left mgnb-20 login-title">登录</h4>
                    <?= $form->field( $loginModel, 'email' )->textInput( [ 'class' => 'login-email form-control mgnb-20',
                        'placeholder'=>'邮箱' ])->label('请输入邮箱：'); ?>
                    <?= $form->field( $loginModel, 'password' )->passwordInput( [ 'class' => 'login-password form-control mgnb-20',
                        'placeholder'=>'密码' ])->label('请输入密码：'); ?>
                    <div class="verify hidden">
                    <?=$form->field($loginModel, 'verifyCode')
                        ->textInput( [ 'class'=>'login-verify form-control mgnb-20', 'placeholder'=>'验证码',
                        'style'=>'width: 25%;display: inline-block;float: left;margin-right: 19px;'] )
                        ->error(['class' =>'help-block help-block-error error-verify-hint'])
                        ->label( false );?>
                    <?= \yii\captcha\Captcha::widget(['name'=>'captchaimg',
                        'captchaAction'=>'login/captcha',
                        'imageOptions'=>['id'=>'captchaimg',
                        'title'=>'换一个', 'alt'=>'换一个',
                        'style'=>'cursor:pointer;border:1px solid #d6cece'],
                        'template'=>'{image}']); ?>
                    </div>
                    <button type="button" id="login-btn" class="btn btn-danger btn-block btn-lg mgnb-20">登 &nbsp;录
                        <img id="login-loading" class="hidden" src="img/loading.gif" alt=""></button>
                    <div class="register-link text-left">
                        <div class="checkbox inline gray">
                            <label>
                                <input type="checkbox" name="status" > 十天内免登陆 &#124;
                            </label>
                        </div>
                        <div class="mgn-tb-10 inline"><a href="#">忘记密码?</a></div>
                        <div class="register inline"><a href="#" id="go-register">去注册</a></div>
                    </div>
                </div>
                <?php ActiveForm::end(); ?>
                <!--注册框-->
                <?php $form = ActiveForm::begin();?>
                <div id="register-box" class="col-md-8 register-box text-left">
                    <h4 class="text-left mgnb-20 register-title">注册</h4>
                    <?=$form->field( $signUpModel, 'email' )
                        ->textInput( [ 'class'=> 'form-control mgnb-20 register-email', 'placeholder'=>'邮箱'] )
                        ->label( '请输入邮箱：');?>
                    <?=$form->field( $signUpModel, 'userName' )
                        ->textInput( [ 'class'=>'form-control mgnb-20 register-user-name', 'placeholder'=>'用户名'])
                        ->label( '请输入用户名：' );?>
                    <?=$form->field( $signUpModel, 'first_psd')
                        ->passwordInput( [ 'class'=>'form-control mgnb-20 register-first-password', 'placeholder'=>'密码'])
                        ->label( '请输入密码：' );?>
                    <?=$form->field( $signUpModel, 'second_psd' )
                        ->passwordInput( [ 'class'=>'form-control mgnb-20 register-second-password', 'placeholder'=>'再次输入密码'])
                        ->label( '请再次输入密码：');?>
                    <!--验证码-->
                    <div class="register-verify">
                        <?=$form->field( $signUpModel, 'verifyCode' )
                            ->textInput( [ 'class'=>'form-control mgnb-20 mgnr-15 inline register-identi', 'placeholder'=>'验证码',
                                'style'=>'width: 25%;display: inline-block;float: left;margin-right: 19px;'] )
                            ->error(['class' =>'help-block help-block-error error-verify-hint'])
                            ->label( false );?>
                        <!--                    和登录的id和name不能一样，否则出错-->
                        <?= \yii\captcha\Captcha::widget(['name'=>'captch',
                            'captchaAction'=>'sign-up/captcha',
                            'imageOptions'=>['id'=>'captch',
                                'title'=>'换一个', 'alt'=>'换一个',
                                'style'=>'cursor:pointer;border:1px solid #d6cece'],
                            'template'=>'{image}']); ?>
                    </div>
                    <button type="button" class="register-btn btn btn-danger btn-block btn-lg mgnb-20">注 &nbsp;册
                        <img id="register-loading" class="hidden" src="img/loading.gif" alt="">
                    </button>
                </div>
            </div>
            <?php ActiveForm::end();?>
            <div class="modal-footer bdr-clear pdgb-30">
                <!--第三方登录-->
                <div class="col-md-4 text-left">
                    <div class="text-center gray">使用第三方登录：</div>
                    <div class="text-center">
<!--                        弹出新窗口-->
                        <script type="text/javascript">
                            function openNewWin(url, title)
                            {
                                window.open(url, title, 'height=400, width=700, top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
                            }
                        </script>
                        <div class="third-logo pull-left">
                            <a href="javascript:openNewWin('/blog/vendor/yiisoft/yii2-authclient-custom/wb/wblogin.php',
                             '微博登录')">
                                <img id="wb_logo" src="img/wb_logo.png" alt="">
                            </a>
                        </div>
                        <div class="third-logo pull-left">
                            <a href="javascript:openNewWin('/blog/vendor/yiisoft/yii2-authclient-custom/qq/qqlogin.php',
                             'QQ登录')" target="_blank">
                                <img id="qq_logo" src="img/qq_logo.png" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <!--留言板标题-->
    <div class="container mgnl--15" id="fixed">
        <div class="row">
            <h3 class="brown col-md-12">
                <span>留言板</span>
                <div class="col-md-6 pull-right fixed-login-exit text-right">
                    <?php
                    // 根据session是否存在判断用户是否登录
                    $session = Yii::$app->session;
                    if ( isset( $session[ 'login' ] ) ){?>
<!--                        已经登录成功-->
                        <a href="javascript:void(0);">欢迎您：<?= $session['login']['userName'];?>,</a>&nbsp;
                        <a href="javascript:void(0);" id="login-out">注销！</a>
                    <?php }else {?>
<!--                        尚未登录-->
                    <a id="login" href="#" data-toggle="modal" data-target="#myModal">登录</a> &frasl;
                    <a id="register" href="#" data-toggle="modal" data-target="#myModal">注册</a>
                    <?php }?>
                </div>
            </h3>
        </div>
        <hr class="grey-bdt line"/>
    </div>
    <!--留言板内容-->
    <?php $form = ActiveForm::begin(); ?>
        <img src="<?php
            if( isset( $_SESSION[ 'login' ][ 'image' ] ) ){
                echo $_SESSION[ 'login' ][ 'image' ];
            } else {
                echo 'img/user-img.jpg';
            }?>" class="user-img" alt="用户头像">
        <br><br>
        <div class="pst-rel canva">
            <?= $form->field($messageModel, 'content')
                ->textArea([ 'id' => 'textArea',
                    'rows' => 4, 'placeholder' => '说点什么吧...', 'resize' => 'none' ])
                ->label( false ); ?>
            <span class="limit-num text-muted">5/300</span>
        </div>
<!--    加上type=button即可禁止提交多次-->
    <button type="button" class="btn btn-info pull-right submit canva">提交评论</button>

    <?php ActiveForm::end(); ?>
        <hr class="grey-bdt wdt-percent pull-right"/>
<!--    循环打印出留言信息-->
    <?php foreach ( $fruit as $val ){ ?>
        <!-- user-discuss -->
        <div class="pull-left wdt-percent">
            <div class="row">
                <div class="col-md-2">
                    <img class="user-img" src="<?=$val[ 'headImg' ];?>" alt="用户头像">
                </div>
                <div class="col-md-9">
                    <div class="row">
                        <h5 class="col-md-12 font-wgt-800 userName"><?=$val[ 'userName' ];?></h5>
                        <div class="col-md-12 mgn-btm-6"><?=$val[ 'content' ];?></div>
                        <div class="col-md-12 write-time">
                            <span class="pdgl-clear col-md-6 text-muted font-12">
                                时间:<span class="time"><?= $val[ 'time' ];?></span>
                            </span>
                            <a class="col-md-5 pdg-clear text-right thumb" href="javascript:void(0);">
                                <span class="text-muted font-15 glyphicon glyphicon-thumbs-up canva"></span>
                            </a>
                            <span class="text-muted font-14 pdg-clear col-md-1">
                                &nbsp;<span class="thumb-num"><?=$val[ 'thumb' ];?></span>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
        <hr class="grey-bdt wdt-percent pull-right"/>
    <?php }?>
    <div class="pull-right">
        <?php
        echo \yii\widgets\LinkPager::widget([
            'pagination' => $page
        ]);?>
    </div>

    <?php echo AppAsset::addPageScript($this,'@web/js/message_board.js'); ?>
</body>
</html>