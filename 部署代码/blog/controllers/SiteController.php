<?php

namespace app\controllers;

use app\models\Article;
use app\models\ArticleMesh;
use app\models\ArticleTerm;
use Yii;
use yii\coreseek\SphinxClient;
use yii\web\Controller;
use app\models\Posts;
use app\models\TermRelationships;
/**
 * 类用途：
 * 1、切换前台页面（主页）
 * 2、传递参数设置导航栏的border-bottom
 * 3、给主页传数据
 */
class SiteController extends Controller
{
    public function actionSearch(){
        // 禁止提示Constant **** already defined错误信息
        error_reporting(0);
        // 获取get提交的数据
        $content = $_GET[ 'content' ];
        // 连接服务器上的coreseek全文搜索
        $sphinx = new SphinxClient();
        $sphinx->SetServer( '123.206.81.240', 9312 );
        $sphinx->SetMatchMode( SPH_MATCH_ANY );
        // 访问的索引
        $index="article";
        $res = $sphinx->Query( $content, $index );
//        var_dump($keywords);exit;
        // 获取出错信息
//        $err = $sphinx->GetLastError();
        // 把查询到的id取出来
        if (isset( $res[ 'matches' ] )){

            $ids= join(',', array_keys( $res[ 'matches' ] ) );
            // 将查询到的id集合，在数据库中查找
            // 并且进行分页
            $where = " `id` in (".$ids.")";
            $select = "id, name, post_keywords,
                post_source, post_date, post_content, post_excerpt, post_title";
            // where 表达式只能添加在这个后面，如果添加在分页内，会出错
            $query = ArticleMesh::find()->where( $where );
            $data = TraitController::paging( $query, 'post_date', '10', $select );
            $model = $data['model'];
            $pages = $data['pages'];
            // 对日期格式重写
            $model = Posts::updateYearMonPatt( $model );
            // 获取查询到总条数
            $count = $query->count();

            $len = count( $model );
            for ( $i = 0; $i < $len; $i++ ) {
                // 对象转换为数组
                $model[ $i ] = TraitController::objectToarray($model[ $i ]);
            }
            // 获取分词结果
            $keywords = $sphinx->BuildKeywords ( $content, $index, false );
            // 利用str_replace函数替换掉搜索到的文章高亮显示分词
            // 这里有一个坑，无法给$Model赋值，$model[ $key ][ $key2 ]这样写即可
            foreach ( $model as $key => $item ) {
                // 找到具体的值
                foreach ( $item as $key2 => $value ) {
                    // 循环关键字
                    foreach ( $keywords as $keyword) {
                        // 1.不改变时间的颜色
                        // 当前的键名:$key2
                        if ( $key2 == 'post_date' ){
                            continue;
                        }
                        // 2.核心替换
                        $model[ $key ][ $key2 ] = str_replace( $keyword['tokenized'],
                            "<font color='red'>".$keyword['tokenized']."</font>",
                            $model[ $key ][ $key2 ]
                        );
                    }
                }
            }
        } else {
            $model = "非常抱歉，未找到任何相关的内容！";
            $pages = null;
            $count = 0;
        }
        // 关闭sphinx
        $sphinx->close();
        // 获取最新文章、文章精选、标签数据;并将结果保存到view内
        $newArt = $artCulling = $terms = null;
        TraitController::getPageInitData( $newArt, $artCulling, $terms);
        // title设置
        $title = "搜索：<span class='text-primary'> “".$content."” <span>";
        // 设置布局文件
        $this->layout = 'index';
        return $this->render( 'result', array(
            'article' => $model,
            'page' => $pages,
            'title' => $title,
            'count' => $count,
        ));
    }
    /* 前台页面 */
    // 主页
    public function actionIndex()
    {
        //运行存储过程函数
        $cmd = Yii::$app->db->createCommand( "call p_replace_article_mesh" );
        $cmd->execute(); // 此处尚未判断返回值
        // 用源生的sql分页摸不着头脑
        // 获取文章列表(数据库中是一个视图)
        // 并且进行分页
        $query = ArticleMesh::find();
        $data = TraitController::paging( $query, 'post_date' );
        $model = $data['model'];
        $pages = $data['pages'];
        // 取出smeta的图片地址进行重新写入
        $model = ArticleMesh::setSmeta( $model );
        $model = Posts::updateYearMonPatt( $model );
        // 获取最新文章、文章精选、标签数据;并将结果保存到view内
        $newArt = $artCulling = $terms = null;
        TraitController::getPageInitData( $newArt, $artCulling, $terms);
        // 设置布局文件
        $this->layout = 'index';
        // 创建提交表单
        $form = new Article();
        return $this->render( 'home',array(
            'article' => $model,
            'page' => $pages,
            'model' =>$form
        ) );
    }

    // 根据id查找文章
    public function actionFindArticleById( ){
        // 获取get提交的数据
        $id = $_GET[ 'id' ];
        $article = ArticleMesh::findArtById( $id );
        // 对查询到的图片地址进行重写
        $article = ArticleMesh::setSmeta( $article );
        // 对日期格式重写
        $article = Posts::updateYearMonPatt( $article );
        // 获取最新文章、文章精选、标签数据;并将结果保存到view内
        $newArt = $artCulling = $terms = null;
        TraitController::getPageInitData( $newArt, $artCulling, $terms);
        // 指定布局文件
        $this->layout = 'index';
        return $this->render( 'article', array(
            'article' => $article,
        ));
    }

    // 显示某个标签下的所有文章
    public function actionShowArticleByTab(){
        // 获取用户传入的标签值
        $tab = $_GET[ 'tab' ];

        // 根据标签查找文章
        $where = "name='".$tab."'";
        $query = ArticleTerm::find()->where( $where );
        $data = TraitController::paging( $query, 'post_date' );
        $model = $data['model'];
        $pages = $data['pages'];
        // 取出smeta的图片地址进行重新写入
        $model = ArticleMesh::setSmeta( $model );
        $model = Posts::updateYearMonPatt( $model );
        // 获取最新文章、文章精选、标签数据;并将结果保存到view内
        $newArt = $artCulling = $terms = null;
        TraitController::getPageInitData( $newArt, $artCulling, $terms);
        // 设置布局文件
        $this->layout = 'index';
        // 创建提交表单
        $form = new Article();
        // title设置
        $title = "标签：".$tab;
        $count = $query->count();
        return $this->render( 'home',array(
            'article' => $model,
            'page' => $pages,
            'model' =>$form,
            'title' =>$title,
            'count' =>$count
        ) );
    }
}
