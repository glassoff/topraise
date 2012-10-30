<?php if ($attention) { ?>
<div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>

<div class="content_checkout__top">
    <div class="checkout-steps">
        <div class="checkout-steps__title">Этапы покупки: </div>
        <div class="checkout-steps__items">
            <div class="checkout-steps__item checkout-steps__item_active">
                <div class="checkout-steps__point">1</div>
                <div class="checkout-steps__item__title">Покупка</div>
                <div class="checkout-steps__arrow"></div>
            </div>
            <div class="checkout-steps__item">
                <div class="checkout-steps__point">2</div>
                <div class="checkout-steps__item__title">Контактная информация</div>
                <div class="checkout-steps__arrow"></div>
            </div>
            <div class="checkout-steps__item">
                <div class="checkout-steps__point">3</div>
                <div class="checkout-steps__item__title">Подтверждение</div>
                <div class="checkout-steps__arrow"></div>
            </div>
        </div>
    </div>

    <div class="checkout-amount">
        <div class="checkout-price">
            <div class="checkout-price__title">
                Общая стоимость:
            </div>
            <div class="checkout-price__value">
                <span class="price"><?php echo $total ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
            </div>
        </div>
    </div>
</div>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="cart-form">
    <table class="cart-table">
        <tr>
            <th></th>
            <th style="width: 300px;">Товар</th>
            <th>Цена</th>
            <th>Количество</th>
            <th>Стоимость</th>
        </tr>
        <?php foreach ($products as $product): ?>
        <tr class="<?php if($product['quantity'] == 0): ?> excluded <?php endif; ?>">
            <td>
                <div class="cart-table__checkbox cart-checkbox <?php if($product['quantity'] > 0): ?> cart-table__checkbox_active <?php endif; ?>" data-productid="<?php echo $product['key']; ?>"></div>
            </td>
            <td>
                <div class="product-item-left">
                    <a href="<?php echo $product['href']; ?>" class="product-item-left__img" title="<?php echo $product['name']; ?>">
                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
                    </a>
                    <div class="product-item-left__content">
                        <h4 class="product-item-left__content__title">
                            <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
                                <?php echo $product['name']; ?>
                            </a>
                            <?php if (!$product['stock']) { ?>
                            <span class="stock">***</span>
                            <?php } ?>
                        </h4>
                        <div class="product-item-left__content__description">
                            <?php //echo $product['description'] ?>
                        </div>
                    </div>
                </div>
            </td>
            <td>
                <span class="price"><?php echo $product['price']; ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
            </td>
            <td>
                <input type="hidden" name="prevquantity[<?php echo $product['key']; ?>]" value="<?php echo $product['prevquantity']; ?>" />
                <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" class="cart-table__count-field"/>
            </td>
            <td>
                <span class="price"><?php echo $product['total']; ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
                <a class="cart-table__delete cart-delete" href="<?php echo $product['remove']; ?>" title="<?php echo $button_remove; ?>"></a>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</form>

<?php echo $shipping_method ?>

<div class="content_checkout__bottom">
    <form action="index.php?route=checkout/payment_address" method="get">
        <input type="hidden" name="route" value="checkout/payment_address" />
        <button class="button content_checkout__button content_checkout__button_next" type="submit" id="next-button">Продолжить</button>
    </form>
    <div class="checkout-amount">
        <div class="checkout-price">
            <div class="checkout-price__title">
                Общая стоимость:
            </div>
            <div class="checkout-price__value">
                <span class="price"><?php echo $total ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
            </div>
        </div>
    </div>

</div>


<script>
    var cartCount = '<?php echo $count ?>';
    var cartTotal = '<?php echo $total ?>';
</script>