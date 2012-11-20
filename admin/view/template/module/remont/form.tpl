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
            <h1><img src="view/image/news.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
        </div>
        <div class="content">
            <div id="tabs" class="htabs"><a href="#tab_general"><?php echo $tab_general; ?></a><a href="#tab_data"><?php echo $tab_data; ?></a><a href="#tab_image"><?php echo $tab_image; ?></a></div>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <div id="tab_general">
                    <?php if(count($languages) > 1):?>
                    <div id="languages" class="htabs">
                        <?php foreach ($languages as $language) { ?>
                        <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                        <?php } ?>
                    </div>
                    <?php endif; ?>
                    <?php foreach ($languages as $language) { ?>
                    <div id="language<?php echo $language['language_id']; ?>">
                        <table class="form">
                            <tr>
                                <td><span class="required">*</span> <?php echo $entry_title; ?></td>
                                <td><input name="remont_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($remont_description[$language['language_id']]) ? $remont_description[$language['language_id']]['title'] : ''; ?>" />
                                    <?php if (isset($error_title[$language['language_id']])) { ?>
                                    <span class="error"><?php echo $error_title[$language['language_id']]; ?></span>
                                    <?php } ?></td>
                            </tr>
                            <tr>
                                <td><?php echo $entry_meta_description; ?></td>
                                <td><textarea name="remont_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5"><?php echo isset($remont_description[$language['language_id']]) ? $remont_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> <?php echo $entry_description; ?></td>
                                <td><textarea name="remont_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($remont_description[$language['language_id']]) ? $remont_description[$language['language_id']]['description'] : ''; ?></textarea>
                                    <?php if (isset($error_description[$language['language_id']])) { ?>
                                    <span class="error"><?php echo $error_description[$language['language_id']]; ?></span>
                                    <?php } ?></td>
                            </tr>
                        </table>
                    </div>
                    <?php } ?>
                </div>
                <div id="tab_data">
                    <table class="form">
                        <tr>
                            <td><?php echo $entry_keyword; ?></td>
                            <td><input type="text" name="keyword" value="<?php echo $keyword; ?>" /></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_type; ?></td>
                            <td>
                                <select name="type">
                                    <option value="equipment" <?php if($type=='equipment'): ?>selected<?php endif; ?>>Монтаж оборудования</option>
                                    <option value="water" <?php if($type=='water'): ?>selected<?php endif; ?>>Монтаж водоснабжения</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_store; ?></td>
                            <td><div class="scrollbox">
                                <?php $class = 'even'; ?>
                                <div class="<?php echo $class; ?>">
                                    <?php if (in_array(0, $remont_store)) { ?>
                                    <input type="checkbox" name="remont_store[]" value="0" checked="checked" />
                                    <?php echo $text_default; ?>
                                    <?php } else { ?>
                                    <input type="checkbox" name="remont_store[]" value="0" />
                                    <?php echo $text_default; ?>
                                    <?php } ?>
                                </div>
                                <?php foreach ($stores as $store) { ?>
                                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                <div class="<?php echo $class; ?>">
                                    <?php if (in_array($store['store_id'], $remont_store)) { ?>
                                    <input type="checkbox" name="remont_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                                    <?php echo $store['name']; ?>
                                    <?php } else { ?>
                                    <input type="checkbox" name="remont_store[]" value="<?php echo $store['store_id']; ?>" />
                                    <?php echo $store['name']; ?>
                                    <?php } ?>
                                </div>
                                <?php } ?>
                            </div></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_status; ?></td>
                            <td><select name="status">
                                <?php if ($status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select></td>
                        </tr>
                        <!--tr>
                            <td><?php echo $entry_image; ?></td>
                            <td valign="top"><input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
                                <img src="<?php echo $preview; ?>" alt="" id="preview" class="image" onclick="image_upload('image', 'preview');" /></td>
                        </tr-->
                    </table>
                </div>
                <div id="tab_image">
                    <table id="images" class="list">
                        <thead>
                        <tr>
                            <td class="left"><?php echo $entry_images; ?></td>
                            <td class="right"><?php echo $entry_sort_order; ?></td>
                            <td></td>
                        </tr>
                        </thead>
                        <?php $image_row = 0; ?>
                        <?php foreach ($remont_images as $remont_image) { ?>
                        <tbody id="image-row<?php echo $image_row; ?>">
                        <tr>
                            <td class="left"><div class="image"><img src="<?php echo $remont_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" />
                                <input type="hidden" name="remont_image[<?php echo $image_row; ?>][image]" value="<?php echo $remont_image['image']; ?>" id="image<?php echo $image_row; ?>" />
                                <br />
                                <a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
                            <td class="right"><input type="text" name="remont_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $remont_image['sort_order']; ?>" size="2" /></td>
                            <td class="left"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
                        </tr>
                        </tbody>
                        <?php $image_row++; ?>
                        <?php } ?>
                        <tfoot>
                        <tr>
                            <td colspan="2"></td>
                            <td class="left"><a onclick="addImage();" class="button"><?php echo $button_add_image; ?></a></td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
    CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
        filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
    });
<?php } ?>
//--></script>
<script type="text/javascript"><!--
function image_upload(field, thumb) {
    $('#dialog').remove();

    $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

    $('#dialog').dialog({
        title: '<?php echo $text_image_manager; ?>',
        close: function (event, ui) {
            if ($('#' + field).attr('value')) {
                $.ajax({
                    url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
                    dataType: 'text',
                    success: function(text) {
                        $('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
                    }
                });
            }
        },
        bgiframe: false,
        width: 800,
        height: 400,
        resizable: false,
        modal: false
    });
};
//--></script>
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
    html  = '<tbody id="image-row' + image_row + '">';
    html += '  <tr>';
    html += '    <td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="remont_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
    html += '    <td class="right"><input type="text" name="remont_image[' + image_row + '][sort_order]" value="" size="2" /></td>';
    html += '    <td class="left"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
    html += '  </tr>';
    html += '</tbody>';

    $('#images tfoot').before(html);

    image_row++;
}
//--></script>
<script type="text/javascript"><!--
$('#tabs a').tabs();
$('#languages a').tabs();
//--></script>
<?php echo $footer; ?>
