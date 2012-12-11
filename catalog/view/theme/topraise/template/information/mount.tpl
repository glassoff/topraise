<?php echo $header; ?>

<div class="center page">
    <?php echo $content_top ?>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content">

            <h1 class="content__header news_header"><?php echo $heading_title; ?></h1>

            <div class="remont-item">

                <?php if(count($images)): ?>
                    <div class="remont-images">
                        <ul id="remont-images">
                            <?php foreach($images as $image): ?>
                                <li>
                                    <a title="Установка раковины на кухне" href="<?php echo $image['popup'] ?>" class="colorbox" rel="colorbox"><img width="174" height="110" src="<?php echo $image['thumb'] ?>" /></a>
                                </li>
                            <?php endforeach; ?>
                        </ul>
                        <a class="arrow-prev" href="#">Previous</a>
                        <a class="arrow-next" href="#">Next</a>
                    </div>

                    <script>
                        $(function(){
                            $('#remont-images').carouFredSel({
                                auto: false,
                                prev: '.arrow-prev',
                                next: '.arrow-next',
                                circular: false,
                                infinite: false,
                                width: 600
                            });

                            $('.colorbox').colorbox({
                                overlayClose: true,
                                opacity: 0.5,
                                transition: 'none',
                                loop: false
                            });
                        });
                    </script>
                <?php endif; ?>

                <?php if($video_code): ?>
                    <div class="remont-video">
                    <?php echo $video_code ?>
                    </div>
                <?php endif; ?>

                <div class="typography">
                    <?php echo $description; ?>
                </div>

                <div>
                    <a onclick="location='<?php echo $remont; ?>'" class="news-item__back"><?php echo $button_remont; ?></a>
                </div>
            </div>

        </div>
    </div>
</div>

<?php echo $footer; ?>