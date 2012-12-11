<?php echo $header; ?>

<div class="center page">
    <?php echo $content_top ?>
    <div class="page__middle content content_checkout">
        <h1 class="content__header">Ваша корзина</h1>

        <div id="cart-body"><?php require_once('cart_body.tpl') ?></div>


    </div>
</div>

<?php echo $footer; ?>