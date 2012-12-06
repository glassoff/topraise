<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div id="notification"></div>
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
                                <button class="button button_buy tocart" data-productid="<?php echo $product['product_id']; ?>">Купить</button>
                            </div>
                        </div>

                    </div>
                <?php } ?>
                <!-- categories -->
                </div>
                <?php if(strlen($description) > 0): ?>
                    <h2 class="subheader"><?php echo $heading_title; ?></h2>
                    <div class="typography"><?php echo $description; ?></div>
                <?php endif; ?>
            <?php } elseif($products) { ?>
                <script>
                    var filterUrl = '<?php echo $filter_url ?>';
                    var currentCategory = '<?php echo $category_id ?>';
                    var minPrice = <?php echo floatval($price_limits["min"]) ?>;
                    var maxPrice = <?php echo floatval($price_limits["max"]) ?>;
                </script>

                <div class="catalog-filter">
                    <div class="catalog-filter__header">
                        <div class="catalog-filter__header__tab"><span class="pseudo-a filter-open">Выбор по параметрам</span></div>
                    </div>
                    <div class="catalog-filter__content filter-element" style="<?php if($open_filter): ?>display: block;<?php endif;?>">
                        <?php foreach($filters as $name => $values): ?>
                        <div class="catalog-filter__content__item">
                            <b><?php echo $name ?>:</b>
                            <?php foreach($values as $value): ?>
                            <span class="pseudo-a filter-item <?php if($value['selected']): ?>selected<?php endif; ?>" data-name="filter<?php echo $value['name'] ?>" data-value="<?php echo $value['value'] ?>"><?php echo $value['text'] ?></span>
                            <?php endforeach; ?>
                        </div>
                        <?php endforeach; ?>

                        <div class="catalog-filter__price">
                            <div class="catalog-filter__price__header">Цена:</div>
                            <div class="catalog-filter__inputs">
                                от <input id="min-price" type="text" name="filterprice-min" value="<?php echo $filter_min_price ?>" /> до <input id="max-price" type="text" name="filterprice-max" value="<?php echo $filter_max_price ?>" />
                            </div>
                            <div class="catalog-filter__slider">
                                <div id="slider-range"></div>
                            </div>
                        </div>


                        <div class="catalog-filter__result filter-result"></div>
                    </div>
                    <div class="catalog-filter__header catalog-filter__header_bottom filter-element" style="<?php if($open_filter): ?>display: block;<?php endif;?>">
                        <div class="catalog-filter__header__tab"><span class="pseudo-a filter-open">Свернуть</span></div>
                    </div>
                    <div class="catalog-filter__header catalog-filter__header_bottom-down filter-element" style="<?php if($open_filter): ?>display: block;<?php endif;?>">
                        <div class="catalog-filter__header__tab"><span class="pseudo-a"></span></div>
                    </div>
                </div>

                <div class="catalog-order">
                    <b><?php echo $text_sort; ?></b>
                    <?php foreach($sorts as $sorts): ?>
                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <a class="catalog-order__item catalog-order__item_active" href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a>
                        <?php } else { ?>
                        <a class="catalog-order__item" href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a>
                        <?php } ?>
                    <?php endforeach; ?>
                </div>

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