<?php
namespace app\controllers;

use app\models\Search;
use yii\data\Pagination;
use app\models\Posts;
use app\models\ArticleMesh;
use app\models\Terms;
use Yii;
/**
 * Class TraitController
 * @package app\controllers
 * @author 向国平
 * @explain 控制器的公共操作
 */
trait TraitController
{
    /**
     * @param $query sql查询结果
     * @param $field 排序字段 默认为date 降序排序
     * @return array  pages=>分页对象 model=>获取到consume表数据
     */
    public static function paging( $query, $field = 'date', $pageSize='12', $select='' )
    {
        // 传入记录总数 and 一页显示记录数
        $pages = new Pagination([ 'totalCount' => $query->count(), 'pageSize' => $pageSize ]);
        $model = $query->offset( $pages->offset )
            ->limit( $pages->limit )
            ->orderBy($field.' DESC')
            ->select( $select )
            ->all();
        return ['pages' => $pages, 'model' => $model];
    }

    /************************************************************************/
    /**
     * @explain 过滤arrObjToArr函数执行后的null值（内部函数）
     * @param $data 传入一个二维数组
     * @return mixed
     */
    public static function filterNull( $data )
    {
        $ilen = count( $data );
        for ( $i = 0; $i < $ilen; $i++ ){
            $jlen = count( $data[ $i ] );
            for ( $j = 0; $j < $jlen; $j++ ){
                // 接收过滤后的值
                $data[ $i ][ $j ] = array_filter( $data[ $i ][ $j ] );
            }
        }
        return $data;
    }
    /**
     * @explain 将数组对象转换为数组（内部函数）和objectToarray一起使用
     * @param $data 三维数组 进入两层，然后把第三层交给对象转数组
     * @return $data 数组
     */
    public static function arrObjToArr( $data )
    {
        $ilen = count( $data );
        for ( $i = 0; $i < $ilen; $i++ ){
            $jlen = count( $data[ $i ] );
            for ( $j = 0; $j < $jlen; $j++ ){
                $data[ $i ][ $j ] = TraitController::objectTOarray( $data[ $i ][ $j ] );
            }
        }
        return $data;
    }
    /**************************以上两个配合使用（objectToarray是公共的）**************************/

    /**
     * @explain 对象转换为数组(内部函数)
     * @param $object 具体对象，不是数组对象
     * @return $array 返回数组形式
     */
    public static function objectToarray($object) {
        if (is_object($object)) {
            foreach ($object as $key => $value) {
                $array[$key] = $value;
            }
        }
        else {
            $array = $object;
        }
        return $array;
    }

    /************************************************************************/
    /**
     * @explain 过滤arrObjToArr函数执行后的null值（内部函数）
     * @param $data 传入一个二维数组
     * @return mixed
     */
    public static function filterNullTwo( $data )
    {
        $ilen = count( $data );
        for ( $i = 0; $i < $ilen; $i++ ){
            // 接收过滤后的值
            $data = array_filter( $data );
        }
        return $data;
    }
    /**
     * @explain 将数组对象转换为数组（内部函数）和objectToarray一起使用
     * @param $data 二维数组
     * @return $data
     */
    public static function arrObjToArrTwo( $data )
    {
        $ilen = count( $data );
        for ( $i = 0; $i < $ilen; $i++ ){
            $data[ $i ] = TraitController::objectTOarray( $data[ $i ] );
        }
        return $data;
    }
    /**************************以上两个配合使用（objectToarray是公共的）**************************/

    /**
     * 获取最新文章、文章精选、标签数据;并将结果保存到view内
     */
    public static function getPageInitData( $newArt, $artCulling, $terms){
        // 获取最新文章
        $newArt = Posts::getNewArticle();
        // 对最新文章日期的格式重写
        $newArt = Posts::updateYearMonPatt( $newArt );
        // 获取文章精选
        $artCulling = ArticleMesh::getArticleCulling();
        // 对文章精选日期的格式重写
        $artCulling = Posts::updateYearMonPatt( $artCulling );
        // 获取标签数据
        $terms = Terms::find()
            ->select("name")
            ->all();
        // 获取搜索表单
        $model = new Search();
        // 将标签、最新文章...传递到布局文件中
        $view = Yii::$app->view;
        $view->params[ 'newArt' ] = $newArt;
        $view->params[ 'terms' ] = $terms;
        $view->params[ 'artCulling' ] = $artCulling;
        $view->params[ 'model' ] = $model;
    }
}