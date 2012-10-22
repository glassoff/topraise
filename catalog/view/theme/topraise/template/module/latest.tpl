<div class="home__new">
    <h2 class="header-dots"><b>Наши новинки</b></h2>

    <?php $countBlocks = ceil(count($products) / 4); ?>
    <div class="home__new__content">
        <div class="b-images evo-gallery" data-totalPages="<?php echo $countBlocks ?>"><div class="b-images__scrollable"><div class="b-images__pages">
            <!-- new -->
            <?php for($i = 0; $i < $countBlocks; $i++): ?>
            <ul>
                <?php for($j = $i * 4; $j < $i * 4 + 4; $j++): ?>
                <?php if(isset($products[$j])): ?>
                <?php $product = $products[$j] ?>
                <li class="product-item product-item_short">
                    <div class="product-item__img">
                        <a href="<?php echo $product['href'] ?>"><img src="<?php echo $product['thumb'] ?>" title="<?php echo $product['name'] ?>" alt="<?php echo $product['name'] ?>"/></a>
                    </div>
                    <h4 class="product-item__title"><a href="<?php echo $product['href'] ?>" title="<?php echo $product['name'] ?>"><?php echo $product['name'] ?></a></h4>
                </li>
                <?php endif; ?>
                <?php endfor; ?>
            </ul>
            <?php endfor; ?>
            <!-- new -->
        </div></div></div>
    </div>
</div>

