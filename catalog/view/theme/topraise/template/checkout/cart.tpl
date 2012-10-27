<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div class="page__middle content content_checkout">
        <h1 class="content__header">Ваша корзина</h1>

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

        <table class="cart-table">
            <tr>
                <th></th>
                <th style="width: 300px;">Товар</th>
                <th>Цена</th>
                <th>Количество</th>
                <th>Стоимость</th>
            </tr>
            <?php foreach ($products as $product): ?>
            <tr>
                <td>
                    <div class="cart-table__checkbox cart-table__checkbox_active"></div>
                </td>
                <td>
                    <div class="product-item-left">
                        <a href="<?php echo $product['href']; ?>" class="product-item-left__img" title="<?php echo $product['name']; ?>">
                            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
                        </a>
                        <div class="product-item-left__content">
                            <h4 class="product-item-left__content__title">
                                <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a>
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
                    <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" class="cart-table__count-field"/>
                </td>
                <td>
                    <span class="price"><?php echo $product['total']; ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
                    <a class="cart-table__delete" href="<?php echo $product['remove']; ?>" title="<?php echo $button_remove; ?>"></a>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>

        <div class="content_checkout__bottom">
            <button class="button content_checkout__button content_checkout__button_next">Продолжить</button>
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