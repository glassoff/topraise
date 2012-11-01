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


        <div id="payment-address">
            <?php if (!isset($redirect)) { ?>
            <div class="checkout-product">
                <table>
                    <thead>
                    <tr>
                        <td class="name"><?php echo $column_name; ?></td>
                        <td class="model"><?php echo $column_model; ?></td>
                        <td class="quantity"><?php echo $column_quantity; ?></td>
                        <td class="price"><?php echo $column_price; ?></td>
                        <td class="total"><?php echo $column_total; ?></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($products as $product) { ?>
                    <tr>
                        <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                            <?php foreach ($product['option'] as $option) { ?>
                            <br />
                            &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                            <?php } ?></td>
                        <td class="model"><?php echo $product['model']; ?></td>
                        <td class="quantity"><?php echo $product['quantity']; ?></td>
                        <td class="price"><?php echo $product['price']; ?></td>
                        <td class="total"><?php echo $product['total']; ?></td>
                    </tr>
                    <?php } ?>
                    <?php foreach ($vouchers as $voucher) { ?>
                    <tr>
                        <td class="name"><?php echo $voucher['description']; ?></td>
                        <td class="model"></td>
                        <td class="quantity">1</td>
                        <td class="price"><?php echo $voucher['amount']; ?></td>
                        <td class="total"><?php echo $voucher['amount']; ?></td>
                    </tr>
                    <?php } ?>
                    </tbody>
                    <tfoot>
                    <?php foreach ($totals as $total) { ?>
                    <tr>
                        <td colspan="4" class="price"><b><?php echo $total['title']; ?>:</b></td>
                        <td class="total"><?php echo $total['text']; ?></td>
                    </tr>
                    <?php } ?>
                    </tfoot>
                </table>
            </div>
            <div class="payment"><?php echo $payment; ?></div>
            <?php } else { ?>
            <script type="text/javascript"><!--
            location = '<?php echo $redirect; ?>';
            //--></script>
            <?php } ?>
        </div>



        <div class="content_checkout__bottom">
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



    </div>
</div>

<?php echo $footer; ?>