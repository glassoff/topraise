<?php echo $header; ?>

<div class="center page">
    <?php echo $content_top ?>
    <div class="page__middle content content_checkout">
        <h1 class="content__header">Оформление заказа</h1>

        <div class="content_checkout__top">
            <div class="checkout-steps">
                <div class="checkout-steps__title">Этапы покупки: </div>
                <div class="checkout-steps__items">
                    <div class="checkout-steps__item">
                        <div class="checkout-steps__point">1</div>
                        <div class="checkout-steps__item__title">Покупка</div>
                        <div class="checkout-steps__arrow"></div>
                    </div>
                    <div class="checkout-steps__item">
                        <div class="checkout-steps__point">2</div>
                        <div class="checkout-steps__item__title">Контактная информация</div>
                        <div class="checkout-steps__arrow"></div>
                    </div>
                    <div class="checkout-steps__item checkout-steps__item_active">
                        <div class="checkout-steps__point">3</div>
                        <div class="checkout-steps__item__title">Способ оплаты</div>
                        <div class="checkout-steps__arrow"></div>
                    </div>
                    <div class="checkout-steps__item">
                        <div class="checkout-steps__point">4</div>
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

        <div class="content_checkout__products">
            <?php echo $cart_products; ?>
        </div>

        <div id="payment-method" class="checkout-address">
            <div class="checkout-content">
                <?php require_once('payment_method_body.tpl') ?>
            </div>
        </div>


        <div class="content_checkout__bottom">
            <a class="button button_a content_checkout__button" href="<?php echo $back; ?>#content">Вернуться</a>
            <button class="button content_checkout__button content_checkout__button_next" type="submit" id="button-payment-method">Продолжить</button>
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
            $('#button-payment-method').live('click', function() {
                $.ajax({
                    url: 'index.php?route=checkout/payment_method/validate',
                    type: 'post',
                    data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'hidden\'], #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
                    dataType: 'json',
                    beforeSend: function() {
                        $('#button-payment-method').attr('disabled', true);
                        $('#button-payment-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                    },
                    complete: function() {
                        $('#button-payment-method').attr('disabled', false);
                        $('.wait').remove();
                    },
                    success: function(json) {
                        $('.warning, .error').remove();

                        if (json['redirect']) {
                            location = json['redirect'];
                        } else if (json['error']) {
                            if (json['error']['warning']) {
                                $('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                                $('.warning').fadeIn('slow');
                            }
                        } else {
                            document.location = "index.php?route=checkout/confirm#content";
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            });
        </script>

    </div>
</div>

<?php echo $footer; ?>