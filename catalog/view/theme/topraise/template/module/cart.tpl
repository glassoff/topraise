<div class="cartbar">
    <div class="cartbar__content">
        <p><a href="<?php echo $cart; ?>">Ваша корзина</a></p>
        <p><span class="price price__small_italic"><span id="cart-total-price"><?php echo $total ?></span> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span></p>
        <p id="cart-total"><?php echo $count ?></p>
    </div>
    <a href="<?php echo $cart; ?>" class="cartbar__icon"><img id="cart-icon" src="catalog/view/theme/topraise/images/cart-icon.png" /></a>
</div>