<div class="left">
    <h2><?php echo $text_your_details; ?></h2>
    <span class="required">*</span> <?php echo $entry_firstname; ?><br />
    <input type="text" name="firstname" value="<?php echo $firstname; ?>" class="large-field" />
    <br />
    <br />
    <span class="required">*</span> <?php echo $entry_lastname; ?><br />
    <input type="text" name="lastname" value="<?php echo $lastname; ?>" class="large-field" />
    <br />
    <br />
    <span class="required">*</span> <?php echo $entry_email; ?><br />
    <input type="text" name="email" value="<?php echo $email; ?>" class="large-field" />
    <br />
    <br />
    <span class="required">*</span> <?php echo $entry_telephone; ?><br />
    <input type="text" name="telephone" value="<?php echo $telephone; ?>" class="large-field" />
    <br />
    <br />
</div>
<div class="right">
    <h2><?php echo $text_your_address; ?></h2>
    <span class="required">*</span> <?php echo $entry_address_1; ?><br />
    <input type="text" name="address_1" value="<?php echo $address_1; ?>" class="large-field" />
    <br />
    <br />
    <?php echo $entry_address_2; ?><br />
    <input type="text" name="address_2" value="<?php echo $address_2; ?>" class="large-field" />
    <br />
    <br />
    <span class="required">*</span> <?php echo $entry_city; ?><br />
    <input type="text" name="city" value="<?php echo $city; ?>" class="large-field" />
    <br />
    <br />
</div>
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
