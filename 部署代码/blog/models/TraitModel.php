<?php
namespace app\models;
/**
 * trait TraitModel
 * @package app\models
 * @author 向国平
 * @explain 模型的公共操作
 */
trait TraitModel
{
    /**
     * @explain ‘-’替换为‘.’=>日期替换
     * @param $model
     * @return mixed
     */
    public static function formatPoint( $model )
    {
        // 遍历数据表
        foreach ( $model as $key=>$value ){
            $value->date = str_replace( '-', '.', $value->date );
        }
        return $model;
    }
    /**
     * @explain 将传入的表数据分类->分成1-n个季度
     * @param $table 传入的是一张排序后的表（降序）
     * @return array $data 从n-1季度的数据
     */
    public static function getQuarterData( $table )
    {
        // 按季度分类
        $data = TraitModel::getClassifyData( $table );
        // 各季度总金额
        $amount = TraitModel::getClassifyAmount( $data );

        return [ 'data' => $data, 'amount' => $amount ];
    }
    /**
     * @explain 将传入的表数据分类->分成1-n个季度
     * @param $table 传入的是一张排序后的表（降序）
     * @return array $data 从n--1季度的数据
     */
    private static function getClassifyData( $table )
    {
        // 最终数组
        $data = [];
        // 最终数组（data）下标
        $num = 0;
        $len = count( $table );
        // 季度数量
        $quarterNum = 1;
        for ( $i = 0, $j = 0; $i < $len; ){
            // 季度相同
            if ( $table[ $i ][ 'quarter' ] == $quarterNum ){
                // 保存到临时数组
                $sdata[ $j++ ] = $table[ $i++ ];
            } else {
                $j = 0;
                $data[$num++] = $sdata;
                $quarterNum++;
                // 清空数组值
                unset($sdata);
            }
        }
        // 循环退出后，将找到的数据赋值（少了这一步会少最后一个季度）
        if ( $i == $len ){
            $data[ $num ] = $sdata;
            // 清空数组值
            unset( $sdata );
        }

        return $data;
    }

    /**
     * @explain 获取分类季度后的各季度总金额
     * @param $data
     * @return array
     */
    private static function getClassifyAmount( $data )
    {
        $amount = [];
        // 存放总金额
        $sum = 0;
        $ilen = count( $data );
        for ( $i = 0, $k = 0; $i < $ilen; $i++,$k++ ){
            // 取出当前数组的长度
            $jlen = count( $data[ $i ] );
            for ( $j = 0; $j < $jlen; $j++ ){
                $sum += $data[ $i ][ $j ][ 'money' ];
            }
            // 存入结果数组
            $amount[ $k ] = $sum;

            // sum置0
            $sum = 0;
        }
        return $amount;
    }
}