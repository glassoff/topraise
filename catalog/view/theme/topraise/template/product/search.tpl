<?php echo $header; ?>

<div class="center page">
    <?php echo $content_top ?>
    <div id="notification"></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content">
            <h1 class="content__header"><?php echo $heading_title; ?></h1>

            <?php if($products): ?>

            <div class="pagination pagination_top"><?php echo $pagination; ?></div>
            <div class="catalog-container">
                <!-- products -->
                <?php foreach ($products as $product) { ?>
                <div class="product-item product-item_full">
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
                        <span class="price price__big"><?php echo $product['price']; ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
                        <button class="button button_buy tocart" data-productid="<?php echo $product['product_id']; ?>">Купить</button>
                    </div>
                </div>
                <?php } ?>
                <!-- products -->
            </div>
            <div class="pagination"><?php echo $pagination; ?></div>

            <?php else: ?>
            <?php echo $text_empty; ?>
            <?php endif; ?>
        </div>
    </div>
</div>

<?php echo $footer; ?>