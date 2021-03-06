<?php echo $header; ?>

<div class="center page">
    <?php echo $content_top ?>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content">
            <h1 class="content__header"><?php echo $heading_title; ?></h1>

            <p>
                <?php echo $text_message; ?>
            </p>

            <a class="button button_blue button_a" href="<?php echo $continue; ?>"><?php echo $button_continue; ?></a>
        </div>
    </div>
</div>

<?php echo $footer; ?>