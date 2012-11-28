<div class="page__middle__left">
    <h5 class="icon-item icon-item_new"><a href="<?php echo $href_latest ?>">НАШИ НОВИНКИ</a></h5>
    <h5 class="icon-item icon-item_best"><a href="<?php echo $href_bestsellers ?>">БЕСТСЕЛЛЕРЫ</a></h5>

    <div class="home__search search_form">
        <form>
            <input type="text" placeholder="Поиск товара"/><button type="submit" class="button">найти</button>
        </form>
    </div>

    <?php if ($modules) { ?>
    <div id="column-left">
        <?php foreach ($modules as $module) { ?>
        <?php echo $module; ?>
        <?php } ?>
    </div>
    <?php } ?>

</div>


