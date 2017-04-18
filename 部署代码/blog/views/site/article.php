<!-- 文章 -->
<main class="col-md-8">
    <article class="card bg-white">
        <header class="text-center">
            <!--标题-->
            <h1 class="card-title mgn-clear"><a href="#"><?=$article['post_title'];?></a></h1>
            <!--作者、时间-->
            <div class="mgnt-15">作者：<span class="cl-brown">奶瓶仔</span> • <time class="card-date"><?=$article['post_date'];?></time></div>
        </header>
        <!--精选图片-->
        <section class="featured-img mgnt-35 text-center">
            <img class="hgt-wdt-percent" src="<?=$article['smeta']?>">
        </section>
        <!--内容-->
        <section class="card-content mgnt-35">
            <p id="t-content">
                <?=$article['post_content'];?>
            </p>
        </section>
        <!--底部-->
        <footer class="card-footer text-left">
            <span class="glyphicon glyphicon-folder-open"></span>
            &nbsp;&nbsp;<?php
            //            将name变量分割成没有逗号的数组
            $arr = explode( ',', $article[ 'name' ] );
            //            循环打印出数组
            foreach ( $arr as $tag ) {
                ?>
                <a class="tag-link-title" href="index.php?r=site/show-article-by-tab&tab=<?=$tag;?>"><?php echo $tag;?></a>
            <?php }?>
        </footer>
    </article>
</main>
