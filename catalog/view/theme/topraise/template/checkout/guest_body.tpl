<h3 class="subsubheader"><?php echo $text_your_details; ?></h3>
<table>
    <tr>
        <td style="width: 200px;"><?php echo $entry_firstname; ?></td>
        <td><input type="text" name="firstname" value="<?php echo $firstname; ?>" /><br/></td>
    </tr>
    <tr>
        <td><?php echo $entry_lastname; ?></td>
        <td><input type="text" name="lastname" value="<?php echo $lastname; ?>" /><br/></td>
    </tr>
    <tr>
        <td><?php echo $entry_email; ?></td>
        <td><input type="text" name="email" value="<?php echo $email; ?>" /><br/></td>
    </tr>
    <tr>
        <td><?php echo $entry_telephone; ?></td>
        <td><input type="text" name="telephone" value="<?php echo $telephone; ?>" /><br/></td>
    </tr>
</table>

<?php if(!$no_delivery): ?>
<h3 class="subsubheader"><?php echo $text_your_address; ?></h3>
<table>
    <tr>
        <td><?php echo $entry_city; ?></td>
        <td><input type="text" name="city" value="<?php echo $city; ?>" /><br/></td>
    </tr>
    <tr>
        <td style="width: 200px;"><?php echo $entry_address_1; ?></td>
        <td><textarea name="address_1"><?php echo $address_1; ?></textarea><br/></td>
    </tr>
    <tr>
        <td><?php echo $entry_address_2; ?></td>
        <td><textarea name="address_2"><?php echo $address_2; ?></textarea><br/></td>
    </tr>
</table>
<?php else: ?>
<input type="hidden" name="no_delivery" value="<?php echo $no_delivery ?>" />
<input type="hidden" name="city" value="<?php echo $city; ?>" />
<input type="hidden" name="address_1" value="<?php echo $address_1; ?>" />
<input type="hidden" name="address_2" value="<?php echo $address_2; ?>" />
<?php endif; ?>

<?php if ($shipping_required) { ?>
<input type="hidden" name="shipping_address" value="1" />
<?php } ?>

<input type="hidden" name="postcode" value="" />
<input type="hidden" name="fax" value="" />
<input type="hidden" name="company" value="" />
<input type="hidden" name="company_id" value="" />
<input type="hidden" name="tax_id" value="" />
<input type="hidden" name="country_id" value="176" />
<input type="hidden" name="zone_id" value="2789" />
