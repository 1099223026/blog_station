$( document ).ready( function(){
    $('a#send-email').trigger("click");
    // 标记是否已经添加过元素
    var sign = false;
    var register_sign = false;
    /* 数据提交到后台，先验证长度 */
    $( '.submit' ).eq( 0 ).click(function () {
        // 用ajax提交到后台 判断用户是否登录（session查看）
        $.post( "index.php?r=login/is-login", {},function( data ){
            //未登录
            if ( data == 'false' ){
                alert( '请先登录！' );
                return false;
            } else {
                // 登录后
                var len = $( '#textArea' ).val().length;
                // 判断用户是否有输入
                if( len < 5 ){
                    alert( '最少输入5个！！');
                    return false;
                } else {
                    // 将留言内容提交到服务器
                    // 获取留言内容
                    var message = $( '#textArea' ).val();
                    // 获取用户头像
                    var img = $( '.user-img' ).eq( 0 ).attr( 'src' );
                    $.post( "index.php?r=message-board/board-content-post", {'message':message,'img':img}, function ( data ) {
                        // 返回true 表示留言成功 (不知为何，成功后这里会返回true)
                        if ( data ){
                            location.reload();
                        } else {
                            // alert( '对不起，您目前无法留言！');
                            alert(data);
                        }

                    });
                }
            }
        }, 'json' );
    })
    /* 点赞单击事件 */
    var len = $( '.thumb' ).length;
    var thumb = $( '.thumb' );
    for ( var i = 0; i < len; i++ ){
        thumb[ i ].i = i;
        // 设置点赞标识
        thumb[ i ].sign = 0;
        $( thumb[ i ] ).bind( 'click', function () {
            var thumbNum = 0;
            var index = 0;
            if ( this.sign == 0 ){
                // 未点赞操作
                // 获取当前的点赞数
                thumbNum    = $( '.thumb-num' ).eq( this.i ).html();
                console.log( thumbNum);
                // 赞数加1
                thumbNum++;
                $( '.thumb' ).eq( this.i ).find( '.glyphicon-thumbs-up' ).css( 'color', '#000' );
                $( '.thumb-num' ).eq( this.i ).html( thumbNum );
                this.sign = 1;
            } else {
                // 点赞的操作
                // 获取当前的点赞数
                thumbNum    = $( '.thumb-num' ).eq( this.i ).html();
                console.log( thumbNum);
                // 赞数减1
                thumbNum--;
                $( '.thumb-num' ).eq( this.i ).html( thumbNum );
                $( '.thumb' ).eq( this.i ).find( '.glyphicon-thumbs-up' ).css( 'color', '#777' );
                this.sign = 0;
            }
            // 获取当前点赞数的父元素 目的是为了获取一个固定的条件，好在数据库中查找
            var time = $( '.write-time span.time' ).eq( this.i ).text();
            var userName = $( '.userName' ).eq( this.i ).text();
            // 用ajax提交到后台
            $.post( "index.php?r=message-board/thumb-post",
                { 'thumbNum': thumbNum, 'time': time, 'userName':userName, 'sign':this.sign },
                function(data){
                    // alert( "Data: " + data );
                }, 'json' );
        })
    }
    /*留言板标题固定定位*/
    var fixed = $( '#fixed' );
    var hr = $( '#fixed hr' );
    /*获取元素到顶部的高度*/
    $( document ).bind( 'scroll', function () {
        // 元素到屏幕顶部的距离计算
        var top_scroll = $( window ).scrollTop();
        var range = fixed.offset().top - top_scroll;
        // 元素到顶部距离小于0
        if( range < 0 ){
            fixed.addClass( 'fixed-title' );
            hr.addClass( 'mgnb-clear' );
        }
        // 滚动条的高度等于0
        if( top_scroll == 0 ) {
            fixed.removeClass( 'fixed-title' );
            hr.removeClass( 'mgnb-clear' );
        }
    })
    /* 登出(注销)*/
    $( '#login-out' ).bind( 'click', function () {
        // 清除session
        $.post( 'index.php?r=login/login-out', {}, function ( data ) {
            // 刷新页面
            window.location.reload();
        }, 'json' );
    });
    /*鼠标移入文本框 全选内容*/
    $( 'input:text, input:password' ).bind( 'click', function () {
        $( this ).select();
    });
    /* 单击登录按钮，提交表单*/
    $( '#login-btn' ).bind( 'click', function () {
        // 隐藏正在加载图标
        hidden_loading( $( '#login-loading' ) );
        var them = $( '#login-loading' ).attr( 'class' );
        if ( !( them.indexOf( 'hidden' ) > 0 ) ){
            $( '#login-loading' ).addClass( 'hidden' );
        }
        // 清除自定义提示内容
        if ( sign ){
            $( '#error-hint' ).remove();
            sign = !sign;
        }
        // 检测验证码是否已经显示 是 ->继续 不是->显示
        var verify = $( '.verify' ).eq( 0 );
        var name = verify.attr( 'class' );
        if ( name.indexOf( 'hidden' ) > 0 ) {
            // 显示输入验证码
            verify.removeClass( 'hidden' );
            // 结束
            return;
        }
        // 获取输入的邮箱、验证码 和密码
        var email = $( '#login-box .login-email' ).eq(0).val();
        var password = $( '#login-box .login-password' ).eq(0).val();
        var verify = $( '.login-verify' ).eq( 0 ).val();
        // 输入的有内容
        if ( email != '' && password != '' && verify != ''){
            // session保存时间 默认是一天
            var time = 3600 * 24;
            // 勾选了多选框
            if ( $("input[type='checkbox']").is(':checked') == true ) {
                // 设置session保存时间
                time = 3600 * 24 * 10;
            }
            // 验证是否是邮箱 密码是否有6位
            var reg = /^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.){1,4}[a-z]{2,3}$/;
            if (  (reg.test( email ) ) && ( password.length >= 6 && password.length <= 16 ) ){
                // 显示正在加载图标
                $( '#login-loading' ).removeClass( 'hidden' );
                // 向后台请求数据，验证用户名密码是否正确
                $.post( "index.php?r=login/entry", { email:email, password:password, time: time, verify:verify },function(data,status){
                    // data=success 表示用户登录成功并已经成功设置session 否则直接输出错误信息
                    // console.log( data);
                    if ( data == 'success' ) {
                        // 刷新当前页面
                        window.location.reload();
                    } else {
                        // 只追加一次
                        if ( !sign ){
                            $(".form-group").eq(0).before("<p id='error-hint' style='color:#a94442'>"+data+"</p>");
                            sign = !sign;
                        }
                    }
                    hidden_loading( $( '#login-loading' ) );
                }, 'json' );
            }

        }
    });
    /*单击注册按钮，提交表单*/
    $( '.register-btn' ).eq( 0 ).bind( 'click', function () {
        // 隐藏正在加载图标
        hidden_loading( $( '#register-loading' ) );
        var them = $( '#register-loading' ).attr( 'class' );
        if ( !( them.indexOf( 'hidden' ) > 0 ) ){
            $( '#register-loading' ).addClass( 'hidden' );
        }
        // 清除自定义提示内容
        if ( register_sign ){
            $( '#error-hint-register' ).remove();
            register_sign = !register_sign;
        }
        // 检测验证码是否已经显示 是 ->继续 不是->显示
        var verify = $( '.register-verify' ).eq( 0 );
        var name = verify.attr( 'class' );
        if ( name.indexOf( 'hidden' ) > 0 ) {
            // 显示输入验证码
            verify.removeClass( 'hidden' );
            // 结束
            return;
        }
        // 获取输入的邮箱、验证码 和密码 用户名
        // 前提条件 两次密码应该相等
        var email = $( '.register-email' ).eq(0).val();
        var password = $( '.register-first-password' ).eq(0).val();
        var password2 = $( '.register-second-password' ).eq(0).val();
        var verify = $( '.register-identi' ).eq( 0 ).val();
        var userName = $( '.register-user-name' ).eq( 0 ).val();
        // 输入的有内容
        if ( email != '' && password != '' && verify != '' && userName != ''){
            // 验证是否是邮箱 密码是否有6位
            var reg = /^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.){1,4}[a-z]{2,3}$/;
            if (  (reg.test( email ) ) && ( password.length >= 6 && password.length <= 16 ) ){
                // 显示正在加载图标
                $( '#register-loading' ).removeClass( 'hidden' );
                // 向后台提交数据
                $.post( "index.php?r=sign-up/entry", { email:email, password:password, password2:password2, userName: userName, verify:verify },function(data,status){
                    // data=success 表示注册成功 应跳转至邮箱激活页面 否则直接输出错误信息
                    if ( data[ 0 ] == 'success' ) {
                        // 跳转到邮箱激活页面(跳转到另外一个地址，好保存相关的信息，然后在下发)
                        window.location.href='index.php?r=sign-up/index&pid='+data[ 1 ];
                    } else {
                        // 只追加一次
                        if ( !register_sign ){
                            $(".register-box .form-group").eq(0).before("<p id='error-hint-register' style='color:#a94442'>"+data+"</p>");
                            register_sign = !register_sign;
                        }
                    }
                    hidden_loading( $( '#register-loading' ));
                }, 'json' );
            }
        }
    });
    /*显示隐藏登录、注册*/
    $( '#login' ).bind( 'click', function () {
        // 显示登录，隐藏注册
        $( '#login-box' ).removeClass( 'hidden' );
        $( '#register-box' ).addClass( 'hidden' );
        // 第一个文本框获取焦点(模态框弹出事件)
        $('#myModal').on('shown.bs.modal', function () {
            $( '.login-email' ).eq( 0 ).focus();
        })
    });
    $( '#register, #go-register' ).bind( 'click', function () {
        // 显示注册，隐藏登录
        $( '#register-box' ).removeClass( 'hidden' );
        $( '#login-box' ).addClass( 'hidden' );
        // 第一个文本框获取焦点(模态框弹出事件)
        $('#myModal').on('shown.bs.modal', function () {
            $( '.register-email' ).eq( 0 ).focus();
        })
    });
    /*重新输入第一次注册密码(实时) 清空第二次密码*/
    $( '.register-first-password' ).eq( 0 ).bind( 'input change', function () {
        $( '.register-second-password' ).eq( 0 ).val( '' );
    })

    /*给回车绑定事件*/
    /*注册绑定*/
    /*给输入邮箱绑定回车事件*/
    $( '.register-email' ).eq( 0 ).keydown( function ( event ) {
       if( event.keyCode == 13 ){
           $( this ).blur();
           $( '.register-user-name' ).eq( 0 ).focus();
       }
    });
    /*给输入用户名绑定回车事件*/
    $( '.register-user-name' ).eq( 0 ).keydown( function ( event ) {
        if( event.keyCode == 13 ){
            $( this ).blur();
            $( '.register-first-password' ).eq( 0 ).focus();
        }
    });
    /*给输入第一个输入密码绑定回车事件*/
    $( '.register-first-password' ).eq( 0 ).keydown( function ( event ) {
        if( event.keyCode == 13 ){
            $( this ).blur();
            $( '.register-second-password' ).eq( 0 ).focus();
        }
    });
    /*给输入第二个输入密码绑定回车事件*/
    $( '.register-second-password' ).eq( 0 ).keydown( function ( event ) {
        if( event.keyCode == 13 ){
            $( this ).blur();
            $( '.register-identi' ).eq( 0 ).focus();
        }
    });
    /*给输入验证码绑定回车事件*/
    $( '.register-identi' ).eq( 0 ).keydown( function ( event ) {
        if( event.keyCode == 13 ){
            $( this ).blur();
            $( '.register-btn' ).eq( 0 ).click();
        }
    });
    /*登录绑定*/
    /*给输入邮箱绑定回车事件*/
    $( '.login-email' ).eq( 0 ).bind( 'keypress', function ( event ) {
       if( event.keyCode == 13 ){
           $( this ).blur();
           $( '.login-password' ).eq( 0 ).focus();
       }
    });
    /*给输入密码绑定回车事件*/
    $( '.login-password' ).eq( 0 ).bind( 'keypress', function ( event ) {
        if( event.keyCode == 13 ){
            // 显示输入验证码
            $( '.verify' ).eq( 0 ).removeClass( 'hidden' );
            $( this ).blur();
            $( '.login-verify' ).eq( 0 ).focus();
        }
    });
    /*回车键提交登录表单*/
    $( '.login-verify' ).keydown( function ( event ) {
        if( event.keyCode == 13) {
            $( this ).blur();
            $( '#login-btn' ).click();
        }
    });

    /*第三方登录*/
    // 在第三方登录图标上绑定单击事件，一旦单击就设定定时器，2s一执行，
    // 用定时器来检测是否存在cookie，存在->刷新页面，删除cookie，取消定时器 ，否->继续检测
    /*第三方微博图标单击事件绑定*/
    $( '#wb_logo' ).bind( 'click', function () {
        timeOut = window.setInterval( "check()", 2000 );
    });
    /*第三方qq图标单击事件绑定*/
    $( '#qq_logo' ).bind( 'click', function () {
        timeOut = window.setInterval( "check()", 2000 );
    });
});

// 检测是否存在第三方登录cookie
function check() {
    if ( getCookie( 'auth' ) == true ){
        // 删除cookie
        delCookie( 'auth' );
        // 清除定时器
        clearInterval( timeOut );
        // 刷新当前页面
        location.reload();
    }
}

/*隐藏正在加载图标*/
function hidden_loading( element ) {
    var them = element.attr( 'class' );
    if ( !( them.indexOf( 'hidden' ) > 0 ) ){
        element.addClass( 'hidden' );
    }
}

// 获取cookie函数
function getCookie(name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}
// 删除cookie
function delCookie(name)
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null)
        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}