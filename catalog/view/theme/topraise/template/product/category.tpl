<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content">
            <h1 class="content__header"><?php echo $heading_title; ?></h1>

            <?php if ($categories) { ?>
                <div class="catalog-container">
                <!-- categories -->
                <?php foreach ($categories as $category) { ?>
                    <?php $product = $category['main_product']; ?>
                    <div class="category-item">
                        <h3 class="category-item__title"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h3>
                        <div class="category-item__img"></div>

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
                                <button class="button button_buy">Купить</button>
                            </div>
                        </div>

                    </div>
                <?php } ?>
                <!-- categories -->
                </div>
                <h2 class="subheader"><?php echo $heading_title; ?></h2>
                <?php echo $description; ?>
            <?php } elseif($products) { ?>
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
                        <button class="button button_buy">Купить</button>
                    </div>
                </div>
                <?php } ?>
                <!-- products -->
                </div>
            <?php } ?>

            <?php if (!$categories && !$products) { ?>
            <div class="content"><?php echo $text_empty; ?></div>
            <br>
            <div class="buttons">
                <div class="right"><a href="<?php echo $continue; ?>" class="button button_a button_green"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>

        </div>
    </div>
</div>

<?php echo $footer; ?>