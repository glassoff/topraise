<?php foreach($menu as $title => $submenu): ?>
<div class="box">
    <div class="box-heading"><?php echo $title ?></div>
    <div class="box-content">
        <div class="box-category">
            <ul>
                <?php foreach($submenu as $subitem): ?>
                <li><a href="<?php echo $subitem['href'] ?>" class="<?php if($subitem['active']): ?>active<?php endif;?>"><?php echo $subitem['title'] ?></a></li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
</div>
<?php endforeach; ?>