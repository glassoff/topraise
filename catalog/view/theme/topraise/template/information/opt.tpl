<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content">
            <h1 class="content__header"><?php echo $heading_title; ?></h1>

            <p>
                Оптовый отдел специализированного магазина сантехники «Top raise» предлагает вам выгодные условия сотрудничества и широкий ассортимент сантехнического оборудования.
            </p>

            <p>
                ТОМСК<br/>
                тел: <?php echo $telephone ?><br/>
                Эл. почта: <?php echo $company_email ?><br/>
            </p>
            <p>
                Также вы можете сделать запрос прайс-листа прямо сейчас заполнив простую форму.
            </p>

            <form class="opt-form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td class="left"><?php echo $entry_name; ?></td>
                        <td>
                            <input type="text" name="name" value="<?php echo $name; ?>" />
                            <br />
                            <?php if ($error_name) { ?>
                            <span class="error"><?php echo $error_name; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td class="left"><?php echo $entry_email; ?></td>
                        <td>
                            <input type="text" name="email" value="<?php echo $email; ?>" />
                            <br />
                            <?php if ($error_email) { ?>
                            <span class="error"><?php echo $error_email; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div class="label"><?php echo $entry_enquiry; ?></div>
                            <textarea name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
                            <br />
                            <?php if ($error_enquiry) { ?>
                            <span class="error"><?php echo $error_enquiry; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="captcha">
                            <div class="label"><?php echo $entry_captcha; ?></div>
                            <input type="text" name="captcha" value="<?php echo $captcha; ?>" /> <img src="index.php?route=information/opt/captcha" alt="" />
                            <div style="clear:both;"></div>
                            <div>
                                <?php if ($error_captcha) { ?>
                                <span class="error"><?php echo $error_captcha; ?></span>
                                <?php } ?>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button class="button button_blue">Отправить</button>
                        </td>
                    </tr>
                </table>

            </form>

        </div>
    </div>
</div>

<?php echo $footer; ?>