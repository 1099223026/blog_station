<?php
namespace Bill\Controller;

use Common\Controller\AdminbaseController;

class IndexController extends AdminbaseController {
    public function pay(){
        if ( IS_POST ){
            // 获取表单数据
            $data[ 'name' ]         = $_POST[ 'pay_name' ];
            $data[ 'price' ]        = $_POST[ 'price' ];
            $data[ 'number' ]       = $_POST[ 'number' ];
            $data[ 'money' ]        = $_POST[ 'money' ];
            $data[ 'taker' ]        = $_POST[ 'taker' ];
            $data[ 'quarter' ]      = $_POST[ 'quarter' ];
            $data[ 'date' ]         = $_POST[ 'pay_date' ];

            // 提交到数据库
            $pay = M( 'consume' );
            if ( $pay->add( $data ) ){
                $this->success('添加成功！');
            } else {
                $this->error("添加失败，请稍后再试！");
            }
        } else {
            $this->display();
        }
    }
    public function income(){
        if ( IS_POST ){
            // 获取表单数据
            $data[ 'taker' ] = $_POST[ 'user' ];
            $data[ 'date' ] = $_POST[ 'income_date' ];
            $data[ 'quarter' ] = $_POST[ 'quarter' ];
            $data[ 'money' ] = $_POST[ 'money' ];

            // 提交到数据库
            $consume = M( 'pay' );
            if ( $consume->add( $data ) ){
                $this->success('添加成功！');
            } else {
                $this->error("添加失败，请稍后再试！");
            }
        } else{
            //获取寝室成员
            $user = M( 'user' );
            $res = $user->field( 'username' )
                ->select();
            $this->user = $res;
            $this->display();
        }

    }
}