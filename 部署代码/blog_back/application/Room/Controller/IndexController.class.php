<?php
namespace Room\Controller;

use Common\Controller\AdminbaseController;

class IndexController extends AdminbaseController {

    public function index(){
        //获取室友信息数据
        $user = M( 'user' );
        $res = $user->field( 'id, username, isadmini, email' )
            ->select();
        $this->user = $res;
        $this->display();
    }
    // 删除室友信息数据
    public function remove(){
        // 获取数据
        $data = I( 'data' );
        // 实例化对象
        $user = M( "user" );
        if ($user->where( "id='".$data[ 'id' ]."'" )->delete() !== false ) {
            $this->success("删除成功！");
        } else {
            $this->error("删除失败，请稍后再试！");
        }
    }
    // 修改室友信息数据
    public function update(){
        if ( IS_POST ){
            // 获取页面数据
            $data[ 'id' ] = $_POST[ 'id' ];
            $data[ 'username' ] = $_POST[ 'name' ];
            $data[ 'email' ] = $_POST[ 'email' ];
            $data[ 'isadmini' ] = $_POST[ 'admin' ];
            // 更新数据库信息
            $user = M( 'user' );
            $num = $user->where( "id='".$data['id']."'" )->save( $data );
            if (  $num == 1 ){
                $this->success( "修改成功", U( 'Room/Index/index' ) );
            } else if( $num == 0){
                $this->error( "您当前未修改任何项！", U( 'Room/Index/index' ) );
            } else{
                $this->error( "修改失败，请稍后再试！", U( 'Room/Index/index' ) );
            }
        } else{
            // 获取数据
            $data = I( 'data' );
            $this->data = $data;
            $this->display();
        }

    }
}