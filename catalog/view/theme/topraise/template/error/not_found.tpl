<?php echo $header; ?>

<div class="center page">
    <?php echo $content_top ?>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content">
            <h1 class="content__header"><?php echo $heading_title; ?></h1>

            <?php require_once('not_found_content.tpl') ?>

        </div>
    </div>
</div>

<?php echo $footer; ?>