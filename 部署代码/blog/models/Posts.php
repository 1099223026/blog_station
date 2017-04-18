<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/1/21
 * Time: 15:18
 */

namespace app\models;


use yii\db\ActiveRecord;

class Posts extends ActiveRecord
{
    /**
     * 将xxxx-xx-xx修改为 xxxx年xx月xx日
     * return : 修改完成的数据
     */
    public static function updateYearMonPatt( $model ){
        $mLen = count( $model );
        if (is_array( $model ) ){
            for ( $i = 0; $i < $mLen; $i++ ){
                // 分别截取出年月日
                $year = substr( $model[ $i ][ 'post_date' ], 0, 4);
                $mon = substr( $model[ $i ][ 'post_date' ], 5, 2);
                $day = substr( $model[ $i ][ 'post_date' ], 8, 2);
                // 重写到model中
                $model[ $i ][ 'post_date' ] = $year.'年'.$mon.'月'.$day.'日';
            }
        } else if ( is_object( $model ) ){
            // 分别截取出年月日
            $year = substr( $model[ 'post_date' ], 0, 4);
            $mon = substr( $model[ 'post_date' ], 5, 2);
            $day = substr( $model[ 'post_date' ], 8, 2);
            // 重写到model中
            $model[ 'post_date' ] = $year.'年'.$mon.'月'.$day.'日';
        }

        return $model;
    }
    /**
     * 获取最新文章（按id排序）
     * return : 文章序列
     */
    public static function getNewArticle(){
        $article = Posts::find()
            ->limit( 3 )
            ->orderBy( 'id DESC' )
            ->select( 'id, post_title, post_date' )
            ->all();
        return $article;
    }
}