<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
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
            <?php require_once(dirname(__FILE__).'/../module/cart_products.tpl') ?>
        </div>

        <?php if(!isset($redirect)): ?>
        <div class="checkout-info">
            <table>
                <tr class="checkout-info__big">
                    <td>Получатель</td>
                    <td><?php echo $lastname ?> <?php echo $firstname ?></td>
                </tr>
                <tr>
                    <td>E-Mail</td>
                    <td><?php echo $email ?></td>
                </tr>
                <tr>
                    <td>Телефон</td>
                    <td><?php echo $telephone ?></td>
                </tr>
                <tr class="checkout-info__big">
                    <td>Доставка</td>
                    <td><?php echo $shipping_method ?></td>
                </tr>
                <tr>
                    <td>Адрес доставки</td>
                    <td><?php echo $shipping_address_1 ?>
                        <?php if($shipping_address_2): ?>
                        <br/><br/><?php echo $shipping_address_2 ?>
                        <?php endif; ?>
                    </td>
                </tr>
                <tr class="checkout-info__big">
                    <td>Оплата</td>
                    <td><?php echo $payment_method ?></td>
                </tr>
                <?php foreach($totals as $total): ?>
                <tr>
                    <td>
                        <?php if($total['code'] == 'shipping'): ?>
                        Доставка
                        <?php else: ?>
                        <?php echo $total['title'] ?>
                        <?php endif; ?>
                    </td>
                    <td>
                        <span <?php if($total['code']=='total'): ?>style="font-size: 18pt;"<?php endif; ?> class="price"><?php echo $total['text'] ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
                    </td>
                </tr>
                <?php endforeach; ?>
            </table>
        </div>
        <?php else: ?>
        <script>
            document.location = '<?php echo $redirect; ?>';
        </script>
        <?php endif; ?>



        <div class="content_checkout__bottom">
            <a class="button button_a content_checkout__button" href="<?php echo $back; ?>">Вернуться</a>

            <?php echo $payment; ?>

        </div>



    </div>
</div>

<?php echo $footer; ?>