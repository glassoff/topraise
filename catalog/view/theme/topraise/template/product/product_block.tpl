<div class="product-info-block <?php if($special) { ?>product-content__special<?php } ?>">
    <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
    <?php if(isset($popup) && $popup): ?>
    <a href="<?php echo $popup; ?>" class="product-content__img colorbox" title="<?php echo $heading_title; ?>">
        <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/>
        <div class="product-content__img__zoom"></div>
    </a>
    <?php else: ?>
        <?php if(isset($href) && $href): ?>
        <a href="<?php echo $product_href ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/></a>
        <?php else: ?>
        <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/>
        <?php endif; ?>
    <?php endif; ?>
    <div class="product-item__buy">
        <?php if($special): ?>
        <div class="product-item__discount">
            <div class="product-item__discount__price">
                <span class="price price__big"><?php echo $special ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
            </div>
            <div class="product-item__discount__title">
                Новая цена
            </div>
        </div>
        <?php endif; ?>
        <span class="price price__big"><?php echo $price ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
        <button class="button button_buy" id="button-cart">Купить</button>
    </div>
</div>

<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, information, .error').remove();

            if (json['error']) {
                if (json['error']['option']) {
                    /*for (i in json['error']['option']) {
                        $('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
                    }*/
                    $('#notification').html('<div class="warning" style="display: none;">Ошибка при добавлении в корзину<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                    $('.warning').fadeIn('slow');

                    $('html, body').animate({ scrollTop: 0 }, 'slow');

                }
            }

            if (json['success']) {
                $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                $('.success').fadeIn('slow');

                $('#cart-total').html(json['total']);

                $('#cart-total-price').html(json['total_price']);

                $('html, body').animate({ scrollTop: 0 }, 'slow', function(){
                    activeCart();
                });
            }
        }
    });
});
//--></script>