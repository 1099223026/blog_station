<?php
namespace app\controllers;

use app\models\Consume;
use app\models\Pay;
use Yii;
use yii\base\Controller;
/**
 * Class ReportController
 * @package app\controllers
 * author: 向国平
 * explain: 生成报表控制器
 */
class ReportController extends Controller
{
    /**
     * @var consume表中需要做报表用到的所有数据
     */
    private $conData;
    /**
     * @var pay表中需要做报表用到的所有数据
     */
    private $payData;

    /**
     * @explain 利用自动调用函数，初始化变量
     */
    public function init()
    {
        // 初始化变量
        $this->conData = $this->consumeQuarterData;
        $this->payData = $this->payQuarterData;
        // 对象转为数组 conData['amount']不需要转换
        $this->conData['data'] = TraitController::arrObjToArr( $this->conData['data'] );
        $this->payData['data'] = TraitController::arrObjToArr( $this->payData['data'] );
        // 过滤对象转数组产生的 null 值
        $this->conData['data'] = TraitController::filterNull( $this->conData['data'] );
        $this->payData['data'] = TraitController::filterNull( $this->payData['data'] );
    }

    /**
     * @explain 季度报表
     * @return string
     */
    public function actionIndex()
    {

        // 获取最新文章、文章精选、标签数据;并将结果保存到view内
        $newArt = $artCulling = $terms = null;
        TraitController::getPageInitData( $newArt, $artCulling, $terms);
        // 设置布局文件
        $this->layout = 'index';
        
        //ConsumeController代码
        // 接收数据（ 分页对象 and 获取到consume表数据 model ）
        $query = Consume::find();
        $data = TraitController::paging( $query );
        $model = $data['model'];
        $pages = $data['pages'];
        // 替换日期中的字符
        $model = Consume::format( $model );
        
        //PayController代码
        // 接收数据（ 分页对象 and 获取到consume表数据 model ）
        $query = Pay::find();
        $data = TraitController::paging( $query );
        $modelP = $data['model'];
        $pagesP = $data['pages'];
        // 替换日期中的字符
        $modelP = Pay::format( $modelP );
        return $this->render( 'report' , [
            'model' => $model,
            'pages' => $pages,
            'modelP' => $modelP,
            'pagesP' => $pagesP,
        ]);

    }

    /**
     * @explain 返回季度综合报表数据(两个总金额)
     * @return json
     * @returnTO report.js
     */
    public function actionSynReport(){
        // 传入的都是数组，最后将$data转为json
        $data = [
            'payAmount' => $this->payData['amount'],
            'conAmount' => $this->conData['amount'],
        ];
        // 统一转换为json
        $data = json_encode($data);
        // 返回数据
        $response = Yii::$app->response;
        $response->data = $data;
    }
    /**
     * @explain 返回季度报表数据（只需要各个季度中各个月份的总金额）
     * @return json
     * @returnTO report.js
     */
    public function actionQuarterReport()
    {
        // 对三维数组按照 date 排序
        $ilen = count( $this->conData['data'] );
        for ( $i = 0; $i < $ilen; $i++ ){
            $result[ $i ] = $this->my_sort($this->conData[ 'data' ][ $i ],'date');
        }
        // 按日期分类
        $data_classify = $this->dateClassify( $result );
        unset( $result );
        // 计算日期块总金额
        $result = $this->dateSumAmount( $data_classify );
        unset( $data_classify );
//        var_dump( $result );//[季度][月份][money]
        // 封装
        $data = [
//            'date_classify' => $data_classify,
            'classify_money' => $result
        ];
        // 返回数据
        $response = Yii::$app->response;
        $response->data = json_encode( $data );
    }

    /**
     * @explain 对二维数组进行排序
     * @param $arrays 规定输入的数组
     * @param $sort_key 规定排列顺序
     * @param int $sort_order 规定排序类型。可能的值是SORT_REGULAR、SORT_NUMERIC和SORT_STRING
     * @param int $sort_type 规定输入的数组
     * @return array|bool 规定输入的数组
     */
    private function my_sort($arrays,$sort_key,$sort_order=SORT_ASC,$sort_type=SORT_REGULAR ){
        if(is_array($arrays)){
            foreach ($arrays as $array){
                if(is_array($array)){
                    $key_arrays[] = $array[$sort_key];
                }else{
                    return false;
                }
            }
        }else{
            return false;
        }
        // 主要是调用php的排序函数
        array_multisort($key_arrays,$sort_order,$sort_type,$arrays);
        return $arrays;
    }
    /**
     * @explain 消费数据 计算分类后日期块金额
     * @return data 三维数组
     * @param result 四维数组
     */
    private function dateSumAmount( $data ){
        // 最终数组
        $result = [];
        // 计数器
        $num1 = 0;
        $num2 = 0;
        $num3 = 0;
        // 求和
        $sum = 0;
        $ilen = count( $data );
        for ( $i = 0; $i < $ilen; $i++ ){
            $jlen = count( $data[ $i ] );
            for ( $j = 0; $j < $jlen; $j++ ){
                $klen = count( $data[ $i ][ $j ] );
                for ( $k = 0; $k < $klen; $k++ ){
                    $sum += $data[ $i ][ $j ][ $k ][ 'money' ];
                }
                $result[ $i ][ $j ][ 'money' ] = $sum;
                $sum = 0;
            }
        }
        return $result;
    }
    /**
     * @explain 消费数据 日期分为9月、10月...、
     * @return result 四维数组 存在优化，四维数组太耗时
     * @param $data 三维数组 data[0][0]
     */
    private function dateClassify( $data )
    {
        // 最终数组(保存的是一个二维数组)
        $result = [];
        // 下标
        $num = 0;
        $sign = 0;
        $jd = 0; // 季度下标
        // 缓存 年、月、季度
        $year_last  = 0;
        $mon_last   = 0;
        $qua_last   = 0;
        // 得到data的长度
        $ilen = count( $data );
        // 遍历一维度
        for ( $i = 0; $i < $ilen; $i++ ){
            // 遍历二维度
            $jlen = count( $data[ $i ] );
            for ( $j = 0; $j < $jlen; $j++ ){
                // 取出当前值的 年、月、季度
                $year = substr( $data[ $i ][ $j ][ 'date' ], 0 ,4 );
                $mon = substr( $data[ $i ][ $j ][ 'date' ], 5 ,2 );
                $qua = $data[ $i ][ $j ][ 'quarter' ];
                // 第一次初始化值
                if ( $i == 0 && $j == 0 ){
                    // 缓存当前年月
                    $year_last  = $year;
                    $mon_last   = $mon;
                    $qua_last   = $qua;
                }
                // 季度、年相等，考虑月，否则，不用考虑
                if ( $qua == $qua_last){
                    if ( $year == $year_last ){
                        // 和下一条记录的 月份相同
                        if ( $mon == $mon_last ){
                            // 保存数组
                            $result[ $jd ][ $num ][ $sign++ ] = $data[ $i ][ $j ];
                        } else {
                            // 当前数组结束，装载下一个数组
                            $num++;
                            $sign = 0;
                            // 将不等的值装载数组中（也就是第一个值）
                            $result[ $jd ][ $num ][ $sign++ ] = $data[ $i ][ $j ];
                        }
                    } else {
                        $num++;
                        $sign = 0;
                        // 将不等的值装载数组中（也就是第一个值）
                        $result[ $jd ][ $num ][ $sign++ ] = $data[ $i ][ $j ];
                    }
                } else {
                    // 季度
                    $jd++;
                    // 月份置0
                    $num = 0;
                    $sign = 0;
                    // 将不等的值装载数组中（也就是第一个值）
                    $result[ $jd ][ $num ][ $sign++ ] = $data[ $i ][ $j ];
                }
                // 无论是年月否相同都要 缓存当前年月
                $year_last  = $year;
                $mon_last   = $mon;
                $qua_last   = $qua;
            }
        }
        return $result;
    }

    /**
     * @explain 获取收费表中的季度信息（ 包括：分类总金额、分类季度 ）
     * @param null
     * @return array $data[ 'data' ][0] or $data['amount']
     */
    public function getPayQuarterData()
    {
        $pay = new Pay();
        // 取出表中数据 并 升序排序
        $tableData = $pay->find()
            ->select([ 'date', 'money', 'quarter' ])
            ->orderBy( 'quarter' )
            ->all();
        // 获取季度数据（ 包括：分类总金额、分类季度 ）
        $data = $pay->getQuarterData( $tableData );
        return $data;
    }
    /**
     * @explain 获取消费表中的季度信息（ 包括：分类总金额、分类季度 ）
     * @param null
     * @return array $data[ 'data' ][0] or $data['amount']
     */
    public function getConsumeQuarterData()
    {
        header("Content-type:text/html;charset=utf-8");
        $consume = new Consume();
        // 取出表中数据 并 升序排序
        $tableData = $consume->find()
            ->select([ 'date', 'money', 'quarter' ])
            ->orderBy( 'quarter' )
            ->all();
        // 获取季度数据（ 包括：分类总金额、分类季度 ）
        $data = $consume->getQuarterData( $tableData );
        return $data;
    }
}