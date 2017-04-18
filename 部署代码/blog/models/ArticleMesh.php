<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/1/21
 * Time: 15:18
 */

namespace app\models;


use yii\db\ActiveRecord;

class ArticleMesh extends ActiveRecord
{
    public static function tableName(){
        return "{{v_article_mesh}}";
    }

    /**
     * 将文章的图片地址重写（json字符串转为单一字符串）
     * return : 重写后的单一地址
     */
    public static function setSmeta( $model ){
        // 取出smeta的图片地址进行重新写入
        $mLen = count( $model );
        if ( is_array( $model ) ){
            for ( $i = 0; $i < $mLen; $i++ ){
                $obj = json_decode( $model[ $i ][ 'smeta' ] );
                // 取出图片地址
                $str = $obj->photo[ 0 ]->url;
                $model[ $i ][ 'smeta' ] = $str;
            }
        } else if ( is_object( $model ) ){
            $obj = json_decode( $model[ 'smeta' ] );
            // 取出图片地址
            $str = $obj->photo[ 0 ]->url;
            $model[ 'smeta' ] = $str;
        }

        return $model;
    }


    /**
     * 根据文章id查询文章的信息
     * return: 返回所查询到的信息
     */
    public static function findArtById( $id = '' ){
        $res = ArticleMesh::find()
            ->where([ 'id' => $id ])
            ->one();
        return $res;
    }

    /**
     * 获取文章精选
     * return : 返回recommended=1的记录
     */
    public static function getArticleCulling(){
        $res = ArticleMesh::find()
            ->where([ 'recommended' => 1 ])
            ->select( 'id, post_date, post_title' )
            ->limit( 10 )
            ->all();
        return $res;
    }
}