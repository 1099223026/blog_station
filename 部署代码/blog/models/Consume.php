<?php
namespace app\models;
/**
 * explain：该类是专门用来访问数据库的活动记录，并不接受用户的输入
 * author：向国平
 */
use yii\db\ActiveRecord;

class Consume extends ActiveRecord
{
    /**
     * @explain ‘-’替换为‘.’=>日期替换
     * @param $model
     * @return mixed
     */
    public static function format( $model )
    {
        // 调用公共model中的格式化函数
        return TraitModel::formatPoint( $model );
    }
    /**
     * @explain 调用TraitModel中的getQuarterData函数
     * @param $table 传入的是一张排序后的表（降序）
     * @return array $data 从n-1季度的数据
     */
    public function getQuarterData( $table )
    {
        return TraitModel::getQuarterData( $table );
    }
}