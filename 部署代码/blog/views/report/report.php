<?php
use app\assets\AppAsset;

// 加载js文件
AppAsset::register( $this );
// $conData['amount'] 消费各个季度金额
// $conData['data'][?] 消费某个季度情况
// $payData['amount'] 缴费各个季度金额
// $payData['data'][?] 缴费某个季度情况（无用数据，最后请记得清除）

//    var_dump( $conData['amount'][0] );
?>
<!--导入 echarts js文件-->
<script src="js/echarts.min.js"></script>
<!--加载report js-->
<?php echo AppAsset::addPageScript( $this, '@web/js/report.js' ); ?>
<main class="col-md-8">
	
	<!--消费清单-->
    <!--卡片-->
    <article class="text-center card bg-white">
        <header>
            <!--标题-->
            <h1 class="card-title mgn-clear"><a href="#">消费清单</a></h1>
            <!--作者、时间-->
            <div class="mgnt-15">作者：<span class="cl-brown">消费系统</span> •
                <time class="card-date">
                    <?php echo date('Y', time());?>年<?php echo date('m', time());?>月<?php echo date('d', time());?>日
                </time>
            </div>
        </header>
        <!--内容-->
        <section class="card-content mgnt-35">
            <!--响应式表格-->
            <div class="table-responsive">
                <table class="table table-hover table-striped table-bordered">
                <tr>
                    <th class="text-center">日期</th><th class="text-center">名称</th>
                    <th class="text-center">单价</th><th class="text-center">数量</th>
                    <th class="text-center">总额</th>
                </tr>
                 <?php foreach ( $model as $key=>$val ){ ?>
                    <tr>
                        <td><?=$val->date; ?></td>
                        <td><?=$val->name; ?></td>
                        <td><?=$val->price; ?></td>
                        <td><?=$val->number; ?></td>
                        <td class="cl-brown text-center">￥<?=$val->money; ?></td>
                    </tr>
                <?php }?>
            </table>
            </div>
        </section>
        <!--底部-->
        <footer class="card-footer text-right">
<!--            页码-->
            <?php
                echo \yii\widgets\LinkPager::widget([
                    'pagination' => $pages,
                ]);
            ?>
        </footer>
    </article>
    
    <!--缴费明细-->
	<!--卡片集-->
    <article class="text-center card bg-white">
        <header>
            <!--标题-->
            <h1 class="card-title mgn-clear"><a href="#">缴费明细</a></h1>
            <!--作者、时间-->
            <div class="mgnt-15">作者：<span class="cl-brown">消费系统</span> •
                <time class="card-date">
                    <?php echo date('Y', time());?>年<?php echo date('m', time());?>月<?php echo date('d', time());?>日
                </time>
            </div>
        </header>
        <!--内容-->
        <section class="card-content mgnt-35">
            <!--响应式表格-->
            <div class="table-responsive">
                <table class="table table-hover table-striped table-bordered">
                    <tr>
                        <th class="text-center">日期</th><th class="text-center">缴费人</th>
                        <th class="text-center">金额</th>
                    </tr>
                    <?php foreach ( $modelP as $val ){ ?>
                        <tr>
                            <td><?=$val->date; ?></td>
                            <td><?=$val->taker; ?></td>
                            <td class="cl-brown">￥<?=$val->money; ?></td>
                        </tr>
                    <?php }?>
                </table>
            </div>
        </section>
        <!--底部-->
        <footer class="card-footer text-right">
            <?php
                echo \yii\widgets\LinkPager::widget([
                    'pagination' => $pagesP,
                ]);
            ?>
        </footer>
    </article>

    <!--季度报表-->
	<!--卡片集-->
    <article class="text-center card bg-white">
        <header>
            <!--标题-->
            <h1 class="card-title mgn-clear"><a href="#">消费-缴费综合报表</a></h1>
            <!--作者、时间-->
            <div class="mgnt-15">作者：<span class="cl-brown">消费系统</span> •
                <time class="card-date">
                    <?php echo date('Y', time());?>年<?php echo date('m', time());?>月<?php echo date('d', time());?>日
                </time>
            </div>
        </header>
        <!--精选报表(装报表的容器)-->
        <section class="featured-canvas mgnt-35"></section>
        <!--内容-->
        <section class="card-content mgnt-35">
            <p class="text-left">
                HTML 4.01 支持 ISO 8859-1 (Latin-1) 字符集。ISO-8859-1 的较低部分（从 1 到 127 之间的代码）是最初的 7 比特 ASCII。ISO-8859-1 的较高部分（从 160 到 255 之间的代码）全都有实体名称这些符号中的大多数都可以在不进行实体引用的情况下使用，但是实体名称或实体编号为那些不容易通过键盘键入的符号提供了表达的方注释：实体名称对大小写敏感。
            </p>
        </section>
        <!--底部-->
        <footer class="card-footer text-left">
            <span class="glyphicon glyphicon-folder-open"></span> 综合报表
        </footer>
    </article>
    <!--卡片-->
    <article class="text-center card bg-white">
        <header>
            <!--标题-->
            <h1 class="card-title mgn-clear"><a href="#">季度综合报表</a></h1>
            <!--作者、时间-->
            <div class="mgnt-15">作者：<span class="cl-brown">消费系统</span> •
                <time class="card-date">
                    <?php echo date('Y', time());?>年<?php echo date('m', time());?>月<?php echo date('d', time());?>日
                </time>
            </div>
        </header>
        <!--季度报表(装报表的容器)-->
        <section class="featured-canvas mgnt-35"></section>
        <!--内容-->
        <section class="card-content mgnt-35">
            <p class="text-left">
                HTML 4.01 支持 ISO 8859-1 (Latin-1) 字符集。ISO-8859-1 的较低部分（从 1 到 127 之间的代码）是最初的 7 比特 ASCII。ISO-8859-1 的较高部分（从 160 到 255 之间的代码）全都有实体名称这些符号中的大多数都可以在不进行实体引用的情况下使用，但是实体名称或实体编号为那些不容易通过键盘键入的符号提供了表达的方注释：实体名称对大小写敏感。
            </p>
        </section>
        <!--底部-->
        <footer class="card-footer text-left">
            <span class="glyphicon glyphicon-folder-open"></span> 季度报表
        </footer>
    </article>
</main>