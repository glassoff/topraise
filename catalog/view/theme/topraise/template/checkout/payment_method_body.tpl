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
                    <td data-tip="<?php echo $payment_method['tip'] ?>"><?php if ($payment_method['code'] == $code || !$code) { ?>
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

<br />
<?php } ?>

<input type="hidden" name="comment" value="" />
<input type="hidden" name="agree" value="1" />

<script>
    $('[name=payment_method]').change(function(){
        var tip = $(this).parents('td').data('tip');
        $('.tip__content').text(tip);

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
    });

    $('[name=payment_method]:checked').change();
</script>




