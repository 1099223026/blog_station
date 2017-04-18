<?php
namespace Consume\Controller;

use Common\Controller\AdminbaseController;

class IndexController extends AdminbaseController {
    // 消费账单显示
    public function pay(){
        $pay = M( "consume" );
        $count = $pay->count();
        // 分页
        $this->paging( $pay, "date desc", $count );
        $this->display();
    }
    // 缴费账单显示
    public function income(){
        $consume = M( "pay" );
        $count = $consume->count();
        // 分页
        $this->paging( $consume, "date desc", $count );
        $this->display();
    }

    public function payUpdate(){
        if ( IS_POST ){
            // 获取提交的数据
            $data[ 'id' ] = $_POST[ 'id' ];
            $data[ 'date' ] = $_POST[ 'date' ];
            $data[ 'name' ] = $_POST[ 'name' ];
            $data[ 'price' ] = $_POST[ 'price' ];
            $data[ 'number' ] = $_POST[ 'number' ];
            $data[ 'money' ] = $_POST[ 'money' ];
            $data[ 'quarter' ] = $_POST[ 'quarter' ];
            // 更新数据库信息
            $pay = M( 'consume' );
            $num = $pay->where( "id='".$data['id']."'" )->save( $data );
            if (  $num == 1 ){
                $this->success( "修改成功", U( 'Consume/Index/pay' ) );
            } else if( $num == 0){
                $this->error( "您当前未修改任何项！", U( 'Consume/Index/pay' ) );
            } else{
                $this->error( "修改失败，请稍后再试！", U( 'Consume/Index/pay' ) );
            }
        } else {
            $this->data = I("data");
            $this->display("pay_update");
        }
    }
    public function payRemove(){
        // 获取数据
        $data = I( 'data' );
        // 实例化对象
        $pay = M( "consume" );
        if ($pay->where( "id='".$data[ 'id' ]."'" )->delete() !== false ) {
            $this->success("删除成功！");
        } else {
            $this->error("删除失败，请稍后再试！");
        }
    }

    public function incomeUpdate(){
        if ( IS_POST ){
            // 获取提交的数据
            $data[ 'id' ] = $_POST[ 'id' ];
            $data[ 'date' ] = $_POST[ 'date' ];
            $data[ 'taker' ] = $_POST[ 'taker' ];
            $data[ 'money' ] = $_POST[ 'money' ];
            $data[ 'quarter' ] = $_POST[ 'quarter' ];
            // 更新数据库信息
            $income = M( 'pay' );
            $num = $income->where( "id='".$data['id']."'" )->save( $data );
            if (  $num == 1 ){
                $this->success( "修改成功", U( 'Consume/Index/income' ) );
            } else if( $num == 0){
                $this->error( "您当前未修改任何项！", U( 'Consume/Index/income' ) );
            } else{
                $this->error( "修改失败，请稍后再试！", U( 'Consume/Index/income' ) );
            }
        } else {
            $this->data = I("data");
            $this->display("income_update");
        }
    }
    public function incomeRemove(){
        // 获取数据
        $data = I( 'data' );
        // 实例化对象
        $income = M( "pay" );
        if ($income->where( "id='".$data[ 'id' ]."'" )->delete() !== false ) {
            $this->success("删除成功！");
        } else {
            $this->error("删除失败，请稍后再试！");
        }
    }

    // 分页(功能函数)
    private function paging( $table_name, $order, $count ){
        $page = $this->page( $count, 10 );
        $data = $table_name->order( $order )
            ->limit( $page->firstRow, $page->listRows )
            ->select();
        // 页面获取
        $this->assign( 'data', $data );
        $this->assign( 'page', $page->show("MX") );
        $this->assign( 'pay');
    }
}