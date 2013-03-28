<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

                <table class="form">
                    <tr>
                        <td><?php echo $entry_total; ?></td>
                        <td><input type="text" name="card_transfer_total" value="<?php echo $card_transfer_total; ?>" /></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_order_status; ?></td>
                        <td><select name="card_transfer_order_status_id">
                            <?php foreach ($order_statuses as $order_status) { ?>
                            <?php if ($order_status['order_status_id'] == $card_transfer_order_status_id) { ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_geo_zone; ?></td>
                        <td><select name="card_transfer_geo_zone_id">
                            <option value="0"><?php echo $text_all_zones; ?></option>
                            <?php foreach ($geo_zones as $geo_zone) { ?>
                            <?php if ($geo_zone['geo_zone_id'] == $card_transfer_geo_zone_id) { ?>
                            <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_status; ?></td>
                        <td><select name="card_transfer_status">
                            <?php if ($card_transfer_status) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <?php } ?>
                        </select></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_sort_order; ?></td>
                        <td><input type="text" name="card_transfer_sort_order" value="<?php echo $card_transfer_sort_order; ?>" size="1" /></td>
                    </tr>
                </table>

                <div class="vtabs">
                    <?php $payment_row = 1; ?>
                    <?php foreach ($payments as $payment) { ?>
                    <a href="#tab-module-<?php echo $payment_row; ?>" id="module-<?php echo $payment_row; ?>">Карта <?php echo $payment_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $payment_row; ?>').remove(); $('#tab-module-<?php echo $payment_row; ?>').remove(); return false;" /></a>
                    <?php $payment_row++; ?>
                    <?php } ?>
                    <span id="module-add">Добавить&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span> </div>
                <?php $payment_row = 1; ?>
                <?php foreach ($payments as $payment) { ?>
                <div id="tab-module-<?php echo $payment_row; ?>" class="vtabs-content">

                    <table class="form">
                        <?php foreach ($languages as $language) { ?>
                        <tr>
                            <td><span class="required">*</span> <?php echo $entry_bank; ?></td>
                            <td><textarea name="card_payment[<?php echo $payment_row ?>][card_transfer_bank_<?php echo $language['language_id']; ?>]" cols="80" rows="10"><?php echo isset($payment['card_transfer_bank_' . $language['language_id']]) ? $payment['card_transfer_bank_' . $language['language_id']] : ''; ?></textarea>
                                <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
                                <?php if (isset(${'error_bank_' . $language['language_id']})) { ?>
                                <span class="error"><?php echo ${'error_bank_' . $language['language_id']}; ?></span>
                                <?php } ?></td>
                        </tr>
                        <?php } ?>
                        <!--tr>
                            <td><?php echo $entry_total; ?></td>
                            <td><input type="text" name="card_payment[<?php echo $payment_row ?>][card_transfer_total]" value="<?php echo $payment['card_transfer_total']; ?>" /></td>
                        </tr-->
                        <!--tr>
                            <td><?php echo $entry_order_status; ?></td>
                            <td><select name="card_payment[<?php echo $payment_row ?>][card_transfer_order_status_id]">
                                <?php foreach ($order_statuses as $order_status) { ?>
                                <?php if ($order_status['order_status_id'] == $payment['card_transfer_order_status_id']) { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select></td>
                        </tr-->
                        <!--tr>
                            <td><?php echo $entry_geo_zone; ?></td>
                            <td><select name="card_payment[<?php echo $payment_row ?>][card_transfer_geo_zone_id]">
                                <option value="0"><?php echo $text_all_zones; ?></option>
                                <?php foreach ($geo_zones as $geo_zone) { ?>
                                <?php if ($geo_zone['geo_zone_id'] == $payment['card_transfer_geo_zone_id']) { ?>
                                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select></td>
                        </tr-->
                        <tr>
                            <td><?php echo $entry_status; ?></td>
                            <td><select name="card_payment[<?php echo $payment_row ?>][card_transfer_status]">
                                <?php if ($payment['card_transfer_status']) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_sort_order; ?></td>
                            <td><input type="text" name="card_payment[<?php echo $payment_row ?>][card_transfer_sort_order]" value="<?php echo $payment['card_transfer_sort_order']; ?>" size="1" /></td>
                        </tr>
                    </table>

                </div>
                <?php $payment_row++; ?>
                <?php } ?>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
var payment_row = <?php echo $payment_row; ?>;

function addModule() {
    html  = '<div id="tab-module-' + payment_row + '" class="vtabs-content">';

html += '<table class="form">';
            <?php foreach ($languages as $language) { ?>
        html +=    '<tr>';
        html +=                '<td><span class="required">*</span> <?php echo $entry_bank; ?></td>';
        html += '<td><textarea name="card_payment[' + payment_row + '][card_transfer_bank_<?php echo $language['language_id']; ?>]" cols="80" rows="10"><?php echo isset(${'card_transfer_bank_' . $language['language_id']}) ? ${'card_transfer_bank_' . $language['language_id']} : ''; ?></textarea>';
        html += '<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />';
                <?php if (isset(${'error_bank_' . $language['language_id']})) { ?>
            html += '<span class="error"><?php echo ${'error_bank_' . $language['language_id']}; ?></span>';
                    <?php } ?>
        html += '</td>';
        html +=  '</tr>';
                <?php } ?>

    /*html += '<tr>';
    html += '<td><?php echo $entry_total; ?></td>';
    html += '<td><input type="text" name="card_payment[' + payment_row + '][card_transfer_total]" value="" /></td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td><?php echo $entry_order_status; ?></td>';
    html += '<td><select name="card_payment[' + payment_row + '][card_transfer_order_status_id]">';
            <?php foreach ($order_statuses as $order_status) { ?>
            html += '<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>';
    <?php } ?>
    html += '</select></td>';
    html += '</tr>';*/

    /*html += '<tr>';
    html +=        '<td><?php echo $entry_geo_zone; ?></td>';
    html += '<td><select name="card_payment[' + payment_row + '][card_transfer_geo_zone_id]">';
    html += '<option value="0"><?php echo $text_all_zones; ?></option>';
            <?php foreach ($geo_zones as $geo_zone) { ?>
        html += '<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>';
    <?php } ?>
    html += '</select></td>';
    html += '</tr>';*/


    html += '<tr>';
    html += '<td><?php echo $entry_status; ?></td>';
    html += '<td><select name="card_payment[' + payment_row + '][card_transfer_status]">';
        html += '<option value="1"><?php echo $text_enabled; ?></option>';
        html += '<option value="0" selected="selected"><?php echo $text_disabled; ?></option>';

    html += '</select></td>';
    html += '</tr>';

    html += '<tr>';
    html += '<td><?php echo $entry_sort_order; ?></td>';
    html += '<td><input type="text" name="card_payment[' + payment_row + '][card_transfer_sort_order]" value="" size="1" /></td>';
    html += '</tr>';


    html +=    '</table>';

    html += '</div>';

    $('#form').append(html);

    $('#language-' + payment_row + ' a').tabs();

    $('#module-add').before('<a href="#tab-module-' + payment_row + '" id="module-' + payment_row + '">Карта ' + payment_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + payment_row + '\').remove(); $(\'#tab-module-' + payment_row + '\').remove(); return false;" /></a>');

    $('.vtabs a').tabs();

    $('#module-' + payment_row).trigger('click');

    payment_row++;
}
//--></script>
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script>
<script type="text/javascript"><!--
<?php $payment_row = 1; ?>
<?php foreach ($payments as $payment) { ?>
    $('#language-<?php echo $payment_row; ?> a').tabs();
<?php $payment_row++; ?>
<?php } ?>
//--></script>
<?php echo $footer; ?>