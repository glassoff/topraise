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
                <div class="vtabs">
                    <?php $module_row = 1; ?>
                    <?php foreach ($modules as $module) { ?>
                    <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_module . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
                    <?php $module_row++; ?>
                    <?php } ?>
                    <span id="module-add"><?php echo $button_add_module; ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span> </div>
                <?php $module_row = 1; ?>
                <?php foreach ($modules as $module) { ?>
                <div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">
                    <input type="hidden"  name="affiliates_module[<?php echo $module_row; ?>][layout_id]" value="999" />
                    <input type="hidden" name="affiliates_module[<?php echo $module_row; ?>][position]" value="none" />
                    <table class="form">
                        <tr>
                            <td>Город:</td>
                            <td><input type="text" name="affiliates_module[<?php echo $module_row; ?>][town]" value="<?php echo $module['town']; ?>" size="30" /></td>
                        </tr>
                        <tr>
                            <td>Адрес:</td>
                            <td><textarea name="affiliates_module[<?php echo $module_row; ?>][address]" cols="80"><?php echo $module['address']; ?></textarea></td>
                        </tr>
                        <tr>
                            <td>Название:</td>
                            <td><input type="text" name="affiliates_module[<?php echo $module_row; ?>][name]" value="<?php echo $module['name']; ?>" size="30" /></td>
                        </tr>
                        <tr>
                            <td>Контактные данные:</td>
                            <td><textarea name="affiliates_module[<?php echo $module_row; ?>][contacts]" cols="80"><?php echo $module['contacts']; ?></textarea></td>
                        </tr>
                        <tr>
                            <td>График работы:</td>
                            <td><textarea name="affiliates_module[<?php echo $module_row; ?>][times]" cols="80"><?php echo $module['times']; ?></textarea></td>
                        </tr>

                        <tr>
                            <td><?php echo $entry_status; ?></td>
                            <td><select name="affiliates_module[<?php echo $module_row; ?>][status]">
                                <?php if ($module['status']) { ?>
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
                            <td><input type="text" name="affiliates_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
                        </tr>
                    </table>
                </div>
                <?php $module_row++; ?>
                <?php } ?>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {
    html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';

    html += '<input type="hidden" name="affiliates_module[' + module_row + '][layout_id]" value="999" />';
    html += '<input type="hidden" name="affiliates_module[' + module_row + '][position]" value="none" />';

    html += '  <table class="form">';
    html += '    <tr>';
    html += '      <td>Город:</td>';
    html += '      <td><input type="text" name="affiliates_module[' + module_row + '][town]" value="" size="30" /></td>';
    html += '    </tr>';
    html += '    <tr>';
    html += '      <td>Адрес:</td>';
    html += '      <td><textarea name="affiliates_module[' + module_row + '][address]" cols="80"></textarea></td>';
    html += '    </tr>';
    html += '    <tr>';
    html += '    <tr>';
    html += '      <td>Название:</td>';
    html += '      <td><input type="text" name="affiliates_module[' + module_row + '][name]" value="" size="30" /></td>';
    html += '    </tr>';
    html += '    <tr>';
    html += '      <td>Контактные данные:</td>';
    html += '      <td><textarea name="affiliates_module[' + module_row + '][contacts]" cols="80"></textarea></td>';
    html += '    </tr>';
    html += '      <td>График работы:</td>';
    html += '      <td><textarea name="affiliates_module[' + module_row + '][times]" cols="80"></textarea></td>';
    html += '    </tr>';

    html += '    <tr>';
    html += '      <td><?php echo $entry_status; ?></td>';
    html += '      <td><select name="affiliates_module[' + module_row + '][status]">';
    html += '        <option value="1"><?php echo $text_enabled; ?></option>';
    html += '        <option value="0"><?php echo $text_disabled; ?></option>';
    html += '      </select></td>';
    html += '    </tr>';
    html += '    <tr>';
    html += '      <td><?php echo $entry_sort_order; ?></td>';
    html += '      <td><input type="text" name="affiliates_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
    html += '    </tr>';
    html += '  </table>';
    html += '</div>';

    $('#form').append(html);

    $('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_module; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');

    $('.vtabs a').tabs();

    $('#module-' + module_row).trigger('click');

    module_row++;
}
//--></script>
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script>
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
    $('#language-<?php echo $module_row; ?> a').tabs();
<?php $module_row++; ?>
<?php } ?>
//--></script>
<?php echo $footer; ?>