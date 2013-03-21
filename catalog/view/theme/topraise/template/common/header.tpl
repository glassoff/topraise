<!DOCTYPE html>

<html>
<head>
    <meta charset='utf-8' />

    <title><?php echo $title; ?></title>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon" />
    <?php }else{ ?>
    <link href="catalog/view/theme/topraise/images/Favicon.ico" rel="icon" />
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>

    <link href="catalog/view/theme/topraise/css/stylesheets/print.css" media="print" rel="stylesheet" type="text/css" />
    <link href="catalog/view/theme/topraise/css/stylesheets/layout.css" media="screen, projection" rel="stylesheet" type="text/css" />
    <link href="catalog/view/theme/topraise/css/stylesheets/elements.css?v=2" media="screen, projection" rel="stylesheet" type="text/css" />
    <link href="catalog/view/theme/topraise/css/stylesheets/pages.css" media="screen, projection" rel="stylesheet" type="text/css" />
    <!--[if lt IE 8]>
    <link href="catalog/view/theme/topraise/css/stylesheets/ie.css" media="screen, projection" rel="stylesheet" type="text/css" />
    <![endif]-->

    <?php foreach ($styles as $style) { ?>
    <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>

    <script src="catalog/view/theme/topraise/js/jquery-1.7.2.min.js"></script>
    <script src="catalog/view/theme/topraise/js/common.js"></script>

    <?php foreach ($scripts as $script) { ?>
    <script type="text/javascript" src="<?php echo $script; ?>"></script>
    <?php } ?>

    <?php echo $google_analytics; ?>
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
                    <div class="header__content__right__phone"><?php echo $telephone ?></div>
                    <div class="header__content__right__action">
                        <a class="header__content__right__action__text" href="<?php echo $this->url->link('information/information', 'information_id=7') ?>">Наши акции</a>
                        <div class="header__content__right__action__label"><img src="catalog/view/theme/topraise/images/action-new.png" /></div>
                    </div>
                    <div class="header__content__right__cart">
                        <?php echo $cart; ?>
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