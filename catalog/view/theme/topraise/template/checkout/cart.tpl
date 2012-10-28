<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div class="page__middle content content_checkout">
        <h1 class="content__header">Ваша корзина</h1>

        <div id="cart-body"><?php require_once('cart_body.tpl') ?></div>


    </div>
</div>

<?php echo $footer; ?>