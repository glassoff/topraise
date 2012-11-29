<div class="page__middle__left">
    <h5 class="icon-item icon-item_new"><a href="<?php echo $href_latest ?>">НАШИ НОВИНКИ</a></h5>
    <h5 class="icon-item icon-item_best"><a href="<?php echo $href_bestsellers ?>">БЕСТСЕЛЛЕРЫ</a></h5>

    <?php require('search-form.tpl') ?>

    <?php if ($modules) { ?>
    <div id="column-left">
        <?php foreach ($modules as $module) { ?>
        <?php echo $module; ?>
        <?php } ?>
    </div>
    <?php } ?>

</div>


