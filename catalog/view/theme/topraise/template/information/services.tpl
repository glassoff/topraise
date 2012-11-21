<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content">

            <h1 class="content__header"><?php echo $heading_title; ?></h1>

            <div class="remont-top">
                <div class="remont-top__left">
                    <?php echo $text ?>
                </div>
                <div class="remont-top__right">
                    <p>Оставьте свою заявку заполнив поля и с вами свяжется наш менеджер.</p>
                    <p>Все поля обязательны для заполнения.</p>
                    <div class="remont-top__right__form">
                        <?php echo $mount_request ?>
                    </div>
                </div>
            </div>

            <div class="remont-list">
                <h3 class="remont-list__title">То, что мы уже сделали</h3>
                <?php foreach($remont_data as $remont): ?>
                <div class="remont-list__item">
                    <a class="remont-list__item__img" href="<?php echo $remont['href'] ?>">
                        <img src="<?php echo $remont['thumb'] ?>" />
                        <?php if($remont['video_code']): ?>
                        <div class="remont-list__item__img__play"></div>
                        <?php endif; ?>
                    </a>
                    <div class="remont-list__item__date">
                        <?php echo $remont['date_added'] ?>
                    </div>
                    <h3 class="remont-list__item__title">
                        <a href="<?php echo $remont['href'] ?>"><?php echo $remont['title'] ?></a>
                    </h3>
                </div>
                <?php endforeach; ?>
            </div>

        </div>
    </div>
</div>

<?php echo $footer; ?>