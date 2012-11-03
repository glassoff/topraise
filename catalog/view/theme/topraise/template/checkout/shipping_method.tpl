<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>

<?php if ($shipping_methods) { ?>

<div class="shipping-methods">
    <h3 class="subsubheader">Способ доставки</h3>
    <table>
        <?php foreach ($shipping_methods as $shipping_method) { ?>
        <?php if(count($shipping_method['quote']) > 1): ?>
        <tr>
            <td colspan="2"><b><?php echo $shipping_method['title']; ?></b></td>
        </tr>
        <?php endif; ?>
        <?php if (!$shipping_method['error']) { ?>
        <?php foreach ($shipping_method['quote'] as $quote) { ?>
        <tr class="highlight">
            <td><?php if ($quote['code'] == $code || !$code) { ?>
                <?php $code = $quote['code']; ?>
                <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
                <?php } ?></td>
            <td>
                <label for="<?php echo $quote['code']; ?>">
                    <?php echo $quote['title']; ?>
                    <?php if($quote['text'] > 0): ?>
                     - <span class="price"><?php echo $quote['text']; ?> <span class="price__sign">Р</span><span class="price__dot">уб.</span></span>
                    <?php endif; ?>
                </label>
            </td>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
            <td colspan="2"><div class="error"><?php echo $shipping_method['error']; ?></div></td>
        </tr>
        <?php } ?>
        <?php } ?>
    </table>
</div>
<input type="hidden" name="comment" value="" id="shipping-comment"/>

<br />
<?php } ?>

