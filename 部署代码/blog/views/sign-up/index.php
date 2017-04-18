<?php
use yii\helpers\Html;
?>
<head>
    <?=Html::cssFile( '@web/css/sign_up.css' ); ?>
</head>
<body>
    <div class="send-success <?= $sign;?>">发送成功!</div>
    <script type="text/javascript">
        // 设置fixed的left
        var send_seccuss = document.getElementsByClassName( 'send-success')[ 0 ];
        send_seccuss.style.left = ( ( document.body.clientWidth - send_seccuss.offsetWidth ) / 2 ) + 'px';
    </script>
    <div id="reg_block" class="g-bd">
        <div class="top_tlt">注册账号</div>
        <div class="m-activate clearfix">
            <div class="acti_img">
                <img src="img/sendmail.png" alt="">
            </div>
            <div class="acti_tlt">请激活账号</div>

            <div class="info-b">
                <p class="tip">
                    <?php
                    // 没有邮箱，关闭窗口
                    if ( $model->email == '' ) {
                        echo '<script>window.close();</script>';
                    }
                    ?>
                    激活邮件已发送到 <?= $model->email;?>邮箱,
                    <br/>
                    请在48小时内登录邮箱完成激活,
                </p>
                <div class="btn-act-con">
                    <a href="<?=$model->url;?>" target="_blank" class="btn-activate btn-red">去激活</a>
                </div>
                <p>没收到验证邮件</p>
                <p>1.尝试到广告邮件、垃圾邮件目录里找找看</p>
                <p>
                    2.邮箱未收到激活邮件，请再次
                    <a href="" id="send-email">发送激活邮件</a>
                </p>
                <p>
                    3.如果重发激活邮件仍未收到，请更换邮箱
                    <a href="index.php?r=message-board/index">重新注册</a>
                </p>
            </div>
        </div>
    </div>
</body>




















