
<div class="content_checkout__bottom">
    <button type="button" id="button-confirm" class="button content_checkout__button content_checkout__button_next"><?php echo $button_confirm; ?></button>
</div>

<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
    $.ajax({
        type: 'get',
        url: 'index.php?route=payment/free_checkout/confirm',
        success: function() {
            location = '<?php echo $continue; ?>';
        }
    });
});
//--></script>
