<?php echo $header; ?>

<script>
    $(function(){
        $('.evo-gallery').each(function(){
            new evoGallery($(this), {
                loader_img: 'assets/images/ajax-loader-black.gif'
            });
        });
    });
</script>

<div class="center home">
    <div class="home__info">
        <img class="home__info__name" src="catalog/view/theme/topraise/images/name.png" alt="Специализированный интернет-магазин сантехники" />
        <div class="home__info__blocks">
            <div class="info-blocks">
                <a class="b-info-block a-first" href="">
                    <i>Просто</i>
                </a>
                <div class="info-blocks__delimeter"></div>
                <a class="b-info-block a-second" href="">
                    <i>Комфортно</i>
                </a>
                <div class="info-blocks__delimeter"></div>
                <a class="b-info-block a-third" href="">
                    <i>Экономично</i>
                </a>
            </div>
        </div>
    </div>
    <div class="home__search search_form">
        <form>
            <input type="text" placeholder="Поиск товара"/><button type="submit" class="button">найти</button>
        </form>
    </div>

    <div id="notification"></div>

    <div class="home__seotext">
        <p>
            У нас вы найдете самый большой выбор <a href="">смесителей</a>, <a href="">аксессуаров</a> и <a href="">мебели для ванных комнат</a>, <a href="">стеклянных раковин</a>, <a href="">кухонных моек</a>, <a href="">зеркал</a> и <a href="">душевых кабин</a>. На ваш выбор представлена эксклюзивная продукция на российском рынке сантехники — стеклянная мебель для ванных комнат, <a href="">зеркала</a> и <a href="">раковины</a>.
        </p>
    </div>

    <?php echo $content_top; ?>
    <?php echo $content_bottom; ?>

</div>

<?php echo $footer; ?>