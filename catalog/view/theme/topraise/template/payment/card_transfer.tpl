
<div class="content_checkout__payment__content">

    <h3 class="subsubheader"><?php echo $text_instruction; ?></h3>
    <div class="content">
        <p style="font-weight: bold; margin-bottom:15px;"><?php echo $text_description; ?></p>
        <p><?php echo $bank; ?></p>
        <p style="font-weight: bold; margin-top: 15px;">Также данная информация по оплате будет отправлена вам на email адрес.</p>
        <p style="font-weight: bold;"><?php echo $text_payment; ?></p>
    </div>

</div>


<div class="content_checkout__bottom">
    <button type="button" id="button-confirm" class="button content_checkout__button content_checkout__button_next"><?php echo $button_confirm; ?></button>
</div>

<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
    $.ajax({
        type: 'get',
        url: 'index.php?route=payment/card_transfer/confirm',
        data: {'id': '<?php echo $id ?>'},
        success: function() {
            location = '<?php echo $continue; ?>';
        }
    });
});
//--></script>
