<?php foreach($menu as $title => $submenu): ?>
<div class="box">
    <div class="box-heading"><?php echo $title ?></div>
    <div class="box-content">
        <div class="box-category">
            <ul>
                <?php foreach($submenu as $subtitle => $href): ?>
                <li><a href="<?php echo $href ?>"><?php echo $subtitle ?></a></li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
</div>
<?php endforeach; ?>