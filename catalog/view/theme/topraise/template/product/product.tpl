<?php echo $header; ?>

<div class="center page">
    <?php echo $content_top ?>
    <div id="notification"></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content content_product">
            <h1 class="content__header content__header_product"><?php echo $heading_title; ?></h1>
            <span class="content_product__sku">№ товара <?php echo $product_info['sku'] ?></span>

            <div class="product-content">
                <div class="compare-products">
                    <div class="compare-products__off" style="<?php if($compared): ?>display: none;<?php endif; ?>">
                        <span class="no-active">Сравнить товар</span>
                        <button class="button button_green" id="compare-button-add" title="Добавить в список сравнения">Добавить</button>
                    </div>
                    <div class="compare-products__on" style="<?php if(!$compared): ?>display: none;<?php endif; ?>">
                        <a class="" href="<?php echo $this->url->link('product/compare', 'category='.$main_category); ?>">Сравнить товар</a>
                        <button class="button button_red" id="compare-button-remove" title="Удалить из списка сравнения">Удалить</button>
                    </div>
                </div>

                <script>
                    $(function(){
                        $('#compare-button-add').click(function(){
                            addToCompare('<?php echo $product_id; ?>', function(){
                                $('.compare-products__off').hide();
                                $('.compare-products__on').show();
                            });
                        });
                        $('#compare-button-remove').click(function(){
                            removeFromCompare('<?php echo $product_id; ?>', function(){
                                $('.compare-products__off').show();
                                $('.compare-products__on').hide();
                            });
                        });
                    });
                </script>

                <div class="product-tabs">
                    <a href="#description"><span>Описание</span></a>
                    <a href="#specs"><span>Технические характеристики</span></a>
                </div>

                <div class="product-content__center product-info">
                    <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                    <div class="product-content__center__left">
                        <?php if($popup): ?>
                        <a href="<?php echo $popup; ?>" class="product-content__img colorbox" title="<?php echo $heading_title; ?>">
                            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/>
                            <div class="product-content__img__zoom"></div>
                        </a>
                        <?php else: ?>
                            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/>
                        <?php endif; ?>
                        <div class="product-item__buy">
                            <span class="price price__big"><?php echo $price ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
                            <button class="button button_buy" id="button-cart">Купить</button>
                        </div>
                    </div>
                    <div class="product-content__center__right product-tabs_content">
                        <div id="description" class="typography"><?php echo $description; ?></div>
                        <div id="specs">
                            <table class="specs__table">
                                <?php foreach ($attribute_groups as $attribute_group): ?>
                                    <?php foreach ($attribute_group['attribute'] as $attribute): ?>
                                    <tr>
                                        <td><?php echo $attribute['name'] ?></td>
                                        <td><?php echo $attribute['text'] ?></td>
                                    </tr>
                                    <?php endforeach; ?>
                                <?php endforeach; ?>
                                <?php if($product_info['height'] > 0 && $product_info['width'] > 0 && $product_info['length'] > 0): ?>
                                <tr>
                                    <td>Размеры (ВхШхГ)</td>
                                    <td>
                                        <?php echo floatval($product_info['height']) ?>x<?php echo floatval($product_info['width']) ?>x<?php echo floatval($product_info['length']) ?> <?php echo $product_info['length_class'] ?>
                                    </td>
                                </tr>
                                <?php endif; ?>
                            </table>
                        </div>
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

            </div>

            <?php if(count($products)): ?>
            <h3 class="subsubheader">Рекомендуем</h3>
            <div class="short-product-list">
                <?php foreach($products as $product): ?>
                <div class="short-product-list__item">
                    <a class="short-product-list__item__img" href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
                    </a>
                    <h4 class="short-product-list__title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                    <div class="short-product-list__price"><span class="price"><?php echo $product['price']; ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span></div>
                </div>
                <?php endforeach; ?>
            </div>
            <?php endif; ?>

            <script>
                $(function(){
                    $('.product-tabs a').tabs();

                    $('.colorbox').colorbox({
                        overlayClose: true,
                        opacity: 0.5,
                        transition: 'none',
                        loop: false
                    });
                });
            </script>
        </div>
    </div>
</div>

<?php echo $footer; ?>