<?php echo $header; ?>

<script>
    $(function(){
        $('.evo-gallery').each(function(){
            var autoscroll = $(this).hasClass('autoscroll');
            var prev = $(".eg_previous_link", this);
            var next = $(".eg_next_link", this);
            var scrolled = $('.b-images__scrollable', $(this)).scrollable({
                items: '.b-images_pages',
                circular: autoscroll,
                keyboard: false,
                prev: prev,
                next: next
            })

            if(autoscroll){
                scrolled.autoscroll({ autoplay: false, interval: 5000 });

                var scrollApi = scrolled.data("scrollable");

                scrollApi.play();
                var conf = scrollApi.getConf();

                prev.click(function(){
                    //conf.circular = false;
                    scrollApi.stop();
                });
                next.click(function(){
                    //conf.circular = false;
                    scrollApi.stop();
                });
            }
        });

    });
</script>

<div class="center home">
    <div class="home__info">
        <img class="home__info__name" src="catalog/view/theme/topraise/images/name.png" alt="Специализированный интернет-магазин сантехники" />
        <div class="home__info__blocks">
            <div class="info-blocks">
                <a class="b-info-block a-first" href="<?php echo $simple ?>">
                    <i>Просто</i>
                </a>
                <div class="info-blocks__delimeter"></div>
                <a class="b-info-block a-second" href="<?php echo $comfortable ?>">
                    <i>Комфортно</i>
                </a>
                <div class="info-blocks__delimeter"></div>
                <a class="b-info-block a-third" href="<?php echo $economicly ?>">
                    <i>Экономично</i>
                </a>
            </div>
        </div>
    </div>

    <?php require('search-form.tpl') ?>

    <div id="notification"></div>

    <?php echo $content_top; ?>
    <?php echo $content_bottom; ?>

</div>

<?php echo $footer; ?>