<?php echo $header; ?>

<div class="center page">
    <?php echo $content_top ?>
    <div id="notification"></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content special-page">

            <?php if($status): ?>
            <h1 class="content__header content__header_product"><?php echo $heading_title; ?></h1>

            <?php if(isset($main_special_product) && $main_special_product): ?>
            <div class="special-page__product product-info">
                <?php include(DIR_TEMPLATE . "topraise/template/product/product_block.tpl"); ?>
            </div>
            <?php endif; ?>

            <div class="typography">
                <?php echo $description; ?>
            </div>

            <?php else: ?>
                <?php if(count($products)):?>
                    <h1 class="content__header content__header_product">Товары по сниженной цене</h1>
                <?php else: ?>
                    <p>Товаров по акции нет</p>
                <?php endif; ?>
            <?php endif; ?>

            <?php if(count($products)): ?>
            <?php if($status): ?>
            <h2 class="special-page__other-header">Остальные товары по новой цене</h2>
            <?php endif; ?>
            <div class="catalog-container">
                <!-- products -->
                <?php foreach ($products as $product) { ?>
                <div class="product-item product-item_full <?php if($product['special']): ?>product-item_special<?php endif; ?>">
                    <div class="product-item__img">
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" /></a>
                    </div>
                    <div class="product-item__middle">
                        <h4 class="product-item__title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                        <div class="product-item__description">
                            <?php echo $product['description']; ?>
                        </div>
                    </div>
                    <div class="product-item__buy">
                        <?php if($product['special']): ?>
                        <div class="product-item__discount">
                            <div class="product-item__discount__price">
                                <span class="price price__big"><?php echo $product['special'] ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
                            </div>
                            <div class="product-item__discount__title">
                                Новая цена
                            </div>
                        </div>
                        <?php endif; ?>
                        <span class="price price__big"><?php echo $product['price']; ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
                        <button class="button button_buy tocart" data-productid="<?php echo $product['product_id']; ?>">Купить</button>
                    </div>
                </div>
                <?php } ?>
                <!-- products -->
            </div>
            <?php endif; ?>

        </div>
    </div>
</div>

<?php echo $footer; ?>