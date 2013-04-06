
<div class="content_checkout__payment__content">

    <h3 class="subsubheader"><?php echo $text_instruction_title; ?></h3>
    <div class="content">
        <?php echo $text_instruction; ?><br /><br />
        <?php echo $text_printpay; ?><br /><br />
        <?php echo $text_payment; ?><br /><br />
        <?php if ($text_order_history) { ?>
        <?php echo $text_order_history; ?><br /><br />
        <?php } ?>
        <p style="font-weight: bold; ">Также данная информация по оплате будет отправлена вам на email адрес.</p>
        <p style="font-weight: bold;"><?php echo $text_payment_coment; ?></p>
    </div>

</div>

<div class="content_checkout__bottom">
    <button type="button" id="button-confirm" class="button content_checkout__button content_checkout__button_next"><?php echo $button_confirm; ?></button>
</div>

<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
    $.ajax({
        type: 'GET',
        url: 'index.php?route=payment/sberbank_transfer/confirm',
        success: function() {
            location = '<?php echo $continue; ?>';
        }
    });
});
//--></script>
