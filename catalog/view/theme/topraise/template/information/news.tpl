<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content">


            <?php if (isset($news_info)) { ?>

            <h1 class="content__header news_header"><?php echo $heading_title; ?></h1>

            <div class="news-item">
                <div class="news-item__date"><?php echo $date_added ?></div>
                <div class="news-item__content typography">
                    <?php if ($image) { ?>
                    <img class="news-item__content__image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                    <?php } ?>
                    <?php echo $description; ?>
                </div>
                <div>
                    <a onclick="location='<?php echo $news; ?>'" class="news-item__back"><?php echo $button_news; ?></a>
                </div>
            </div>


            <?php } elseif (isset($news_data)) { ?>

            <h1 class="content__header"><?php echo $heading_title; ?></h1>

            <?php foreach ($news_data as $news): ?>
            <div class="news-list-item">
                <h3 class="news-list-item__header"><a href="<?php echo $news['href']; ?>"><?php echo $news['title']; ?></a></h3>
                <div class="news-list-item__date"><?php echo $news['date_added']; ?></div>
                <div class="news-list-item__content">
                    <?php if($news['thumb']): ?>
                    <a href="<?php echo $news['href']; ?>" title="<?php echo $news['title']; ?>"><img alt="<?php echo $news['title']; ?>" src="<?php echo $news['thumb'] ?>" class="news-list-item__content__image"/></a>
                    <?php endif; ?>
                    <?php echo $news['description']; ?>&hellip;
                    <div class="news-list-item__content__more">
                        <a href="<?php echo $news['href']; ?>"><?php echo $text_read_more; ?></a>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
            <div class="pagination"><?php echo $pagination; ?></div>

            <?php } ?>

        </div>
    </div>
</div>

<?php echo $footer; ?>