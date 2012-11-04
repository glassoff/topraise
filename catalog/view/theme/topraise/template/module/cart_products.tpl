<div class="checkout-products-list">
    <?php foreach($products as $product): ?>
    <div class="product-item-left">
        <a href="<?php echo $product['href']; ?>" class="product-item-left__img" title="<?php echo $product['name']; ?>">
            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
        </a>
        <div class="product-item-left__content">
            <h4 class="product-item-left__content__title">
                <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
                    <?php echo $product['name']; ?>
                </a>
            </h4>
            <div class="product-item-left__content__description">
                <?php //echo $product['description'] ?>
                <p><span class="price"><?php echo $product['price'] ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span></p>
                <p><?php echo $product['quantity'] ?> шт.</p>
            </div>
        </div>
    </div>
    <?php endforeach; ?>
</div>