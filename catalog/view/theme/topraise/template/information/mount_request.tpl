<form class="mount-form" action="<?php echo $action?>" method="post" enctype="multipart/form-data">
    <div class="mount-form__label"><?php echo $entry_name ?></div>
    <input type="text" name="name" value="<?php echo $name ?>" />
    <br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>

    <div class="mount-form__label"><?php echo $entry_address ?></div>
    <textarea name="address"><?php echo $address ?></textarea>
    <br />
    <?php if ($error_address) { ?>
    <span class="error"><?php echo $error_address; ?></span>
    <?php } ?>

    <div class="mount-form__label"><?php echo $entry_howdo ?></div>
    <textarea name="howdo"><?php echo $howdo ?></textarea>
    <br />
    <?php if ($error_howdo) { ?>
    <span class="error"><?php echo $error_howdo; ?></span>
    <?php } ?>

    <div class="mount-form__label"><?php echo $entry_date ?></div>
    <input type="text" name="date" value="<?php echo $date ?>" />
    <br />
    <?php if ($error_date) { ?>
    <span class="error"><?php echo $error_date; ?></span>
    <?php } ?>

    <div class="mount-form__label"><?php echo $entry_comment ?></div>
    <textarea name="comment" style="height: 100px;"><?php echo $comment ?></textarea>

    <div class="mount-form__label"><?php echo $entry_captcha; ?></div>
    <div class="mount-form__captcha">
        <input type="text" name="captcha" value="<?php echo $captcha ?>" style="width: 100px; "/> <img src="index.php?route=information/opt/captcha" alt="" />
    </div>
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>

    <button class="button button_blue" type="submit">Отправить</button>
</form>