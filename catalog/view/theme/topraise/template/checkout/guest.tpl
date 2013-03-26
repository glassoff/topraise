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
                    <div class="checkout-steps__item checkout-steps__item_active">
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

        <div class="content_checkout__products">
            <?php echo $cart_products; ?>
        </div>

        <div id="payment-address" class="checkout-address">
            <?php require_once('guest_body.tpl') ?>
        </div>


        <div class="content_checkout__bottom">
            <a class="button button_a content_checkout__button" href="<?php echo $back; ?>#content">Вернуться</a>
            <button class="button content_checkout__button content_checkout__button_next" type="submit" id="button-guest">Продолжить</button>
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
            $('#button-guest').live('click', function() {
                $.ajax({
                    url: 'index.php?route=checkout/guest/validate',
                    type: 'post',
                    data: $('#payment-address input[type=\'text\'], #payment-address textarea, #payment-address input[type=\'hidden\'], #payment-address input[type=\'checkbox\']:checked, #payment-address select'),
                    dataType: 'json',
                    beforeSend: function() {
                        $('#button-guest').attr('disabled', true);
                        $('#button-guest').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                    },
                    complete: function() {
                        $('#button-guest').attr('disabled', false);
                        $('.wait').remove();
                    },
                    success: function(json) {
                        $('.warning, .error').remove();

                        if (json['redirect']) {
                            location = json['redirect'];
                        } else if (json['error']) {
                            if (json['error']['warning']) {
                                $('#payment-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                                $('.warning').fadeIn('slow');
                            }

                            if (json['error']['firstname']) {
                                $('#payment-address input[name=\'firstname\'] + br').after('<span class="error">' + json['error']['firstname'] + '</span>');
                            }

                            if (json['error']['lastname']) {
                                $('#payment-address input[name=\'lastname\'] + br').after('<span class="error">' + json['error']['lastname'] + '</span>');
                            }

                            if (json['error']['email']) {
                                $('#payment-address input[name=\'email\'] + br').after('<span class="error">' + json['error']['email'] + '</span>');
                            }

                            if (json['error']['telephone']) {
                                $('#payment-address input[name=\'telephone\'] + br').after('<span class="error">' + json['error']['telephone'] + '</span>');
                            }

                            if (json['error']['company_id']) {
                                $('#payment-address input[name=\'company_id\'] + br').after('<span class="error">' + json['error']['company_id'] + '</span>');
                            }

                            if (json['error']['tax_id']) {
                                $('#payment-address input[name=\'tax_id\'] + br').after('<span class="error">' + json['error']['tax_id'] + '</span>');
                            }

                            if (json['error']['address_1']) {
                                $('#payment-address [name=\'address_1\'] + br').after('<span class="error">' + json['error']['address_1'] + '</span>');
                            }

                            if (json['error']['city']) {
                                $('#payment-address input[name=\'city\'] + br').after('<span class="error">' + json['error']['city'] + '</span>');
                            }

                            if (json['error']['postcode']) {
                                $('#payment-address input[name=\'postcode\'] + br').after('<span class="error">' + json['error']['postcode'] + '</span>');
                            }

                            if (json['error']['country']) {
                                $('#payment-address select[name=\'country_id\'] + br').after('<span class="error">' + json['error']['country'] + '</span>');
                            }

                            if (json['error']['zone']) {
                                $('#payment-address select[name=\'zone_id\'] + br').after('<span class="error">' + json['error']['zone'] + '</span>');
                            }
                        } else {
                            document.location = "index.php?route=checkout/payment_method#content";
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