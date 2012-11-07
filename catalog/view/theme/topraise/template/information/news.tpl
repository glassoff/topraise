<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content">
            <h1 class="content__header"><?php echo $heading_title; ?></h1>

            <?php if (isset($news_info)) { ?>
            <div class="content" <?php if ($image) { echo 'style="min-height: ' . $min_height . 'px;"'; } ?>>
            <?php if ($image) { ?>
            <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="fancybox"><img align="right" style="border: none; margin-left: 10px;" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
            <?php } ?>
            <?php echo $description; ?>
            </div>
            <div class="buttons">
                <div class="right"><a onclick="location='<?php echo $news; ?>'" class="button"><span><?php echo $button_news; ?></span></a></div>
            </div>
            <?php } elseif (isset($news_data)) { ?>

            <?php foreach ($news_data as $news): ?>
            <div class="news-list-item">
                <h3 class="news-list-item__header"><?php echo $news['title']; ?></h3>
                <div class="news-list-item__date"><?php echo $news['date_added']; ?></div>
                <div class="news-list-item__content">
                    <img src="<?php echo $news['thumb'] ?>" class="news-list-item__content__image"/>
                    <?php echo $news['description']; ?>&hellip;
                    <div class="news-list-item__content__more">
                        <a href="<?php echo $news['href']; ?>"><?php echo $text_read_more; ?></a>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>

            <?php } ?>

        </div>
    </div>
</div>

<?php echo $footer; ?>