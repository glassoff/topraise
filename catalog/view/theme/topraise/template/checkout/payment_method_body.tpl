<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<h3 class="subsubheader"><?php echo $text_payment_method; ?></h3>

<table class="tip-table">
    <tr>
        <td class="tip-table__content">
            <table class="radio">
                <?php foreach ($payment_methods as $payment_method) { ?>
                <tr class="highlight">
                    <td data-raddress="<?php if(isset($payment_method['required_address'])){echo $payment_method['required_address'];} ?>" data-tip="<?php if(isset($payment_method['tip'])) {echo $payment_method['tip'];} ?>"><?php if ($payment_method['code'] == $code || !$code) { ?>
                        <?php $code = $payment_method['code']; ?>
                        <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
                        <?php } else { ?>
                        <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
                        <?php } ?>
                    </td>
                    <td><label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label></td>
                </tr>
                <?php } ?>
            </table>
        </td>
        <td class="tip-table__tip">
            <div class="tip">
                <div class="tip__content">
                    <?php echo $payment_methods[$code]['tip']; ?>
                </div>
            </div>
        </td>
    </tr>
</table>

<?php if($address_show): ?>
<div class="checkout-address" id="payment-address" style="display: none; border-bottom: none;">
    <h3 class="subsubheader">Для данного способа оплаты требуется указать ваш адрес</h3>
    <table>
        <tr>
            <td><?php echo $entry_city; ?></td>
            <td><input type="text" name="city" value="<?php echo $city; ?>" /><br/></td>
        </tr>
        <tr>
            <td style="width: 100px;"><?php echo $entry_address_1; ?></td>
            <td><textarea name="address_1"><?php echo $address_1; ?></textarea><br/></td>
        </tr>
    </table>
    <input type="hidden" name="required_address" value="0" />
</div>
<?php endif; ?>

<br />
<?php } ?>

<input type="hidden" name="comment" value="" />
<input type="hidden" name="agree" value="1" />

<script>
    $('[name=payment_method]').change(function(){
        var tip = $(this).parents('td').data('tip');
        $('.tip__content').text(tip);

        if(!tip){
            $('.tip').hide();
            return;
        }
        $('.tip').show();

        var firstPos = 15;
        var bgHeight = 30;
        var height = $('.tip').height();
        var index = $(this).parents('tr').index();
        var h = 30;
        var y = 0;

        y = index*h + firstPos;

        if(y > height - firstPos - bgHeight){
            var p = y - (height - firstPos - bgHeight);
            $('.tip').css('padding-top', p+'px');
        }
        else{
            $('.tip').css('padding-top', '0px');
        }

        $('.tip').css('background-position', '0 ' + y + 'px');

        if($(this).parents('td').data('raddress')){
            $("[name=required_address]").val(1);
            $('#payment-address').show();
        }
        else{
            $("[name=required_address]").val(0);
            $('#payment-address').hide();
        }
    });

    $('[name=payment_method]:checked').change();
</script>




