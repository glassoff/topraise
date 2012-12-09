<table class="compared-table">
    <tr>
        <th><div style="font-size: 14pt; width: 200px;">характеристики товара</div></th>
        <?php foreach($products as $product): ?>
        <th>
            <div class="product-item-left">
                <a href="<?php echo $product['remove']; ?>" class="product-item-left__remove" title="Убрать из списка сравнения"></a>
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
                        <p><span class="price"><?php echo $product['price'] ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span></p>
                    </div>
                </div>
            </div>
        </th>
        <?php endforeach; ?>
    </tr>

    <tr>
        <td class="attr-name"><?php echo $text_model; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['model']; ?></td>
        <?php } ?>
    </tr>
    <tr>
        <td class="attr-name"><?php echo $text_manufacturer; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
        <?php } ?>
    </tr>
    <tr>
        <td class="attr-name"><?php echo $text_availability; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['availability']; ?></td>
        <?php } ?>
    </tr>
    <!--tr>
        <td><?php echo $text_rating; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><img src="catalog/view/theme/default/image/stars-<?php echo $products[$product['product_id']]['rating']; ?>.png" alt="<?php echo $products[$product['product_id']]['reviews']; ?>" /><br />
            <?php echo $products[$product['product_id']]['reviews']; ?></td>
        <?php } ?>
    </tr-->
    <tr>
        <td class="attr-name"><?php echo $text_summary; ?></td>
        <?php foreach ($products as $product) { ?>
        <td class="description"><?php echo $products[$product['product_id']]['description']; ?></td>
        <?php } ?>
    </tr>
    <tr>
        <td class="attr-name"><?php echo $text_weight; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['weight']; ?></td>
        <?php } ?>
    </tr>
    <tr>
        <td class="attr-name"><?php echo $text_dimension; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></td>
        <?php } ?>
    </tr>

    <?php foreach ($attribute_groups as $attribute_group): ?>
        <?php foreach ($attribute_group['attribute'] as $key => $attribute): ?>
            <tr>
                <td class="attr-name"><?php echo $attribute['name']; ?></td>
                <?php foreach ($products as $product) { ?>
                <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
                <td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
                <?php } else { ?>
                <td></td>
                <?php } ?>
                <?php } ?>
            </tr>
        <?php endforeach; ?>
    <?php endforeach; ?>
</table>