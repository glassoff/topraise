<!DOCTYPE html>

<html>
<head>
    <meta charset='utf-8' />
    <title>TopRaise</title>
    <link href="catalog/view/theme/topraise/css/stylesheets/print.css" media="print" rel="stylesheet" type="text/css" />
    <link href="catalog/view/theme/topraise/css/stylesheets/layout.css" media="screen, projection" rel="stylesheet" type="text/css" />
    <link href="catalog/view/theme/topraise/css/stylesheets/elements.css" media="screen, projection" rel="stylesheet" type="text/css" />
    <link href="catalog/view/theme/topraise/css/stylesheets/pages.css" media="screen, projection" rel="stylesheet" type="text/css" />
    <!--[if lt IE 8]>
    <link href="catalog/view/theme/topraise/css/stylesheets/ie.css" media="screen, projection" rel="stylesheet" type="text/css" />
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/topraise/css/stylesheets/default1.css" />
    <script src="catalog/view/theme/topraise/js/jquery-1.4.4.min.js"></script>
    <script src="catalog/view/theme/topraise/js/jquery.tools.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
    <script src="catalog/view/theme/topraise/js/gslider.js"></script>
    <script>
        $(function(){
            $('.evo-gallery').each(function(){
                new evoGallery($(this), {
                    loader_img: 'assets/images/ajax-loader-black.gif'
                });
            });
        });
    </script>
</head>
<body>
<div class="g-layout">
    <div class="g-header">
        <div class="header">
            <div class="header__title">Интернет-магазин комфорта</div>
            <div class="header__logo">
                <a href="<?php echo $home; ?>" alt="TopRaise" title="Перейти на главную страницу"><img src="catalog/view/theme/topraise/images/logo.jpg" /></a>
                <div class="header__logo__slogan">Ключ к вашему комфорту</div>
            </div>
            <div class="header__content">
                <div class="header__content__right">
                    <div class="header__content__right__phone">(3822) 65-65-82</div>
                    <div class="header__content__right__action">
                        <a class="header__content__right__action__text" href="">Наши акции</a>
                        <div class="header__content__right__action__label"><img src="catalog/view/theme/topraise/images/action-new.png" /></div>
                    </div>
                    <div class="header__content__right__cart cartbar">
                        <div class="cartbar__content">
                            <p><a href="">Ваша корзина</a></p>
                            <p><span class="price price__small_italic">20000 <span class="price__sign">Р</span><span class="price__dot">уб.</span></span></p>
                            <p>1 товар</p>
                        </div>
                        <a href="" class="cartbar__icon"><img src="catalog/view/theme/topraise/images/cart-icon.png" /></a>
                    </div>
                </div>
            </div>
            <div class="header-menu">
                <ul>
                    <?php foreach($top_menu as $menu_item): ?>
                    <li><a href="<?php echo $menu_item['href'] ?>"><?php echo $menu_item['title'] ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </div>
        </div>
    </div>

    <div class="g-center">