<div class="home__popular">
    <h2 class="header-dots"><b>Бестселлеры сантехники</b></h2>

    <?php $countBlocks = ceil(count($products) / 4); ?>
    <div class="home__popular__content">
        <div class="b-images evo-gallery autoscroll" data-totalpages="<?php echo $countBlocks ?>"><div class="b-images__scrollable"><div class="b-images__pages">
            <!-- popular -->
            <?php for($i = 0; $i < $countBlocks; $i++): ?>
            <ul>
                <?php for($j = $i * 4; $j < $i * 4 + 4; $j++): ?>
                <?php if(isset($products[$j])): ?>
                <?php $product = $products[$j] ?>
                <li class="product-item product-item_full <?php if($product['special']): ?>product-item_special<?php endif; ?>">
                    <div class="product-item__img">
                        <a href="<?php echo $product['href'] ?>" title="<?php echo $product['name'] ?>"><img src="<?php echo $product['thumb'] ?>" title="<?php echo $product['name'] ?>" alt="<?php echo $product['name'] ?>"/></a>
                    </div>
                    <div class="product-item__middle">
                        <h4 class="product-item__title"><a href="<?php echo $product['href'] ?>" title="<?php echo $product['name'] ?>"><?php echo $product['name'] ?></a></h4>
                        <div class="product-item__description">
                            <?php echo $product['description'] ?>
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
                        <span class="price price__big"><?php echo $product['price'] ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
                        <button class="button button_buy tocart" data-productid="<?php echo $product['product_id']; ?>">Купить</button>
                    </div>
                </li>
                <?php endif; ?>
                <?php endfor; ?>
            </ul>
            <?php endfor; ?>
            <!-- popular -->
        </div></div><a class="eg_previous_link">Previous</a><a class="eg_next_link">Next</a></div>
    </div>
</div>