<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content content_product">
            <h1 class="content__header content__header_product"><?php echo $heading_title; ?></h1>
            <span class="content_product__sku">№ товара 12545DA</span>

            <div class="product-content">
                <div class="compare-products">
                    <a class="no-active" href="">Сравнить товар</a>
                    <button class="button _button_red button_green">Добавить</button>
                </div>

                <div class="product-tabs">
                    <a href="#description"><span>Описание</span></a>
                    <a href="#specs"><span>Технические характеристики</span></a>
                </div>

                <div class="product-content__center">
                    <div class="product-content__center__left">
                        <a href="<?php echo $popup; ?>" class="product-content__img colorbox" title="<?php echo $heading_title; ?>">
                            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/>
                            <div class="product-content__img__zoom"></div>
                        </a>
                        <div class="product-item__buy">
                            <span class="price price__big"><?php echo $price ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
                            <button class="button button_buy">Купить</button>
                        </div>
                    </div>
                    <div class="product-content__center__right product-tabs_content">
                        <div id="description"><?php echo $description; ?></div>
                        <div id="specs">
                            <table class="specs__table">
                                <tr>
                                    <td>Наличие крыши</td>
                                    <td>нет</td>
                                </tr>
                                <tr>
                                    <td>Конструкция дверей</td>
                                    <td>раздвижные</td>
                                </tr>
                                <tr>
                                    <td>Тип задней стенки</td>
                                    <td>стеклянная</td>
                                </tr>
                                <tr>
                                    <td>Цвет задних стекол</td>
                                    <td>матовый</td>
                                </tr>
                                <tr>
                                    <td>Цвет передних стекол</td>
                                    <td>матовый</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

            </div>

            <h3 class="subsubheader">Рекомендуем</h3>
            <div class="short-product-list">
                <div class="short-product-list__item">
                    <a class="short-product-list__item__img" href="">
                        <img src="catalog/view/theme/topraise/images/product-short.jpg" />
                    </a>
                    <h4 class="short-product-list__title"><a href="">Fresh H310 G 90 см</a></h4>
                    <div class="short-product-list__price"><span class="price">20000 <span class="price__sign">Р</span><span class="price__dot">уб.</span></span></div>
                </div>
                <div class="short-product-list__item">
                    <a class="short-product-list__item__img" href="">
                        <img src="catalog/view/theme/topraise/images/product-short.jpg" />
                    </a>
                    <h4 class="short-product-list__title"><a href="">Fresh H310 G 90 см</a></h4>
                    <div class="short-product-list__price"><span class="price">20000 <span class="price__sign">Р</span><span class="price__dot">уб.</span></span></div>
                </div>
                <div class="short-product-list__item">
                    <a class="short-product-list__item__img" href="">
                        <img src="catalog/view/theme/topraise/images/product-short.jpg" />
                    </a>
                    <h4 class="short-product-list__title"><a href="">Fresh H310 G 90 см</a></h4>
                    <div class="short-product-list__price"><span class="price">20000 <span class="price__sign">Р</span><span class="price__dot">уб.</span></span></div>
                </div>
                <div class="short-product-list__item">
                    <a class="short-product-list__item__img" href="">
                        <img src="catalog/view/theme/topraise/images/product-short.jpg" />
                    </a>
                    <h4 class="short-product-list__title"><a href="">Fresh H310 G 90 см</a></h4>
                    <div class="short-product-list__price"><span class="price">20000 <span class="price__sign">Р</span><span class="price__dot">уб.</span></span></div>
                </div>
            </div>

            <script type="text/javascript" src="../../javascript/jquery/tabs.js"></script>
            <script type="text/javascript" src="../../javascript/jquery/colorbox/jquery.colorbox-min.js"></script>
            <link href="../../javascript/jquery/colorbox/colorbox.css" media="screen, projection" rel="stylesheet" type="text/css" />
            <script>
                $(function(){
                    $('.product-tabs a').tabs();

                    $('.colorbox').colorbox({
                        overlayClose: true,
                        opacity: 0.5
                    });
                });
            </script>
        </div>
    </div>
</div>

<?php echo $footer; ?>