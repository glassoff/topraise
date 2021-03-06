<?php echo $header; ?>

<div class="center page">
    <?php echo $content_top ?>
    <div id="notification"></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content content_product">
            <h1 class="content__header content__header_product"><?php echo $heading_title; ?></h1>
            <?php if($product_info['sku']): ?>
            <span class="content_product__sku">№ товара <?php echo $product_info['sku'] ?></span>
            <?php endif; ?>

            <div class="product-content <?php if($special): ?>product-content__special<?php endif; ?>">
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
                    <div class="product-content__center__left">
                        <?php include("product_block.tpl") ?>
                    </div>
                    <div class="product-content__center__right product-tabs_content">
                        <div id="description" class="typography"><?php echo $description; ?></div>
                        <div id="specs">
                            <table class="specs__table">
                                <?php if($product_info['manufacturer']): ?>
                                    <tr>
                                        <td><?php echo $text_manufacturer ?></td>
                                        <td><?php echo $product_info['manufacturer'] ?></td>
                                    </tr>
                                <?php endif; ?>
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