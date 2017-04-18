<!--  结果集 -->
<main class="col-md-8">

    <article class="card bg-white">
        <header class="text-center">
            <!--结果集标题-->
            <h1 class="card-title mgn-clear"><a href="javascript:void(0);"><?=$title;?></a></h1>
            <!--搜索总记录数-->
            <div class="mgnt-15">共 <?=$count;?> 篇文章</div>
        </header>
    </article>

    <article class="card bg-white">
        <?php if ( is_array( $article ) ){?>
            <?php foreach ( $article as $art ){?>
                <ul>
                    <li><h4><a target="_blank" href="index.php?r=site/find-article-by-id&id=<?= $art['id']?>" class="a-line"><?=$art['post_title'];?></a></h4></li>
                    <li>
                        <span><?=$art['post_date'];?></span> -
                        <span class="black"><?=$art['post_excerpt'];?>...</span>
                    </li>
                    <li>
                        <span>文章来源：
                            <a href="<?php
                                $regx = "/^http.*/";
                                $match = preg_match( $regx, $art['post_source'] );
                                if( $match > 0 ){ echo $art['post_source']; }
                                else{ echo 'javascript:void(0);';}
                                ?>" class="a-line" target="_blank">
                                <?=$art['post_source'];?>
                            </a>
                        </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>关键词：<?=$art['post_keywords'];?></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>标签：<?=$art['name'];?></span>
                    </li>
                </ul>
                <br>
            <?php }?>
        <?php } else {?>
            <p class="text-center">
        <?php echo $article;}?>
            </p>
    </article>
    <div class="pull-right">
        <?php
        if ( isset( $page ) ) {
            echo \yii\widgets\LinkPager::widget([
                'pagination' => $page
            ]);
        }
        ?>
    </div>
</main>
