<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content">

            <h1 class="content__header news_header"><?php echo $heading_title; ?></h1>

            <div class="remont-item">

                <?php if($video_code): ?>
                <?php echo $video_code ?>
                <?php endif; ?>

                <?php echo $description; ?>
                <div>
                    <a onclick="location='<?php echo $remont; ?>'" class="news-item__back"><?php echo $button_remont; ?></a>
                </div>
            </div>

        </div>
    </div>
</div>

<?php echo $footer; ?>