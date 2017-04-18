<?php

namespace app\models;
use yii\base\Model;

class Article extends Model
{
    public $id; // 文档在数据库中对应的id
    public $title; // 文档标题
}