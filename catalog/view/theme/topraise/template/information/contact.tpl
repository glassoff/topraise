<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content">
            <h1 class="content__header"><?php echo $heading_title; ?></h1>

            <div class="contacts-info">
                <div class="contacts-info__address">
                    <table>
                        <tr>
                            <td class="left">Адрес магазина</td>
                            <td class="right"><?php echo $address ?></td>
                        </tr>
                    </table>
                </div>
                <div class="contacts-info__times">
                    <?php echo $times ?>
                </div>
            </div>
            <div class="contacts-map">
                <div class="contacts-map__container">
                    <div class="contacts-map__content">
                        <img src="<?php echo $map ?>" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php echo $footer; ?>