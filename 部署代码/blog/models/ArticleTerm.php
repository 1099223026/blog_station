<?php
namespace app\models;


use yii\db\ActiveRecord;

class ArticleTerm extends ActiveRecord
{
    public static function tableName(){
        return "{{v_article_term}}";
    }
}