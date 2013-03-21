<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content">
        <div class="box-category">
            <ul>
                <?php foreach ($categories as $category) { ?>
                <li>
                    <?php if ($category['category_id'] == $category_id) { ?>
                    <a href="<?php echo $category['href']; ?>" class="active<?php if($child_id){ ?> subactive<?php } ?>"><?php echo $category['name']; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                    <?php } ?>
                    <?php if ($category['children']) { ?>
                    <ul>
                        <?php foreach ($category['children'] as $child) { ?>
                        <li>
                            <?php if ($child['category_id'] == $child_id) { ?>
                            <a href="<?php echo $child['href']; ?>" class="active<?php if($child3_id){ ?> subactive<?php } ?>"><?php echo $child['name']; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                            <?php } ?>

                            <?php if ($child['children']) { ?>
                            <ul>
                                <?php foreach ($child['children'] as $child3) { ?>
                                <li>
                                    <?php if ($child3['category_id'] == $child3_id) { ?>
                                    <a href="<?php echo $child3['href']; ?>" class="active"><?php echo $child3['name']; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $child3['href']; ?>"><?php echo $child3['name']; ?></a>
                                    <?php } ?>
                                </li>
                                <?php } ?>
                            </ul>
                            <?php } ?>

                        </li>
                        <?php } ?>
                    </ul>
                    <?php } ?>
                </li>
                <?php } ?>
            </ul>
        </div>
    </div>
</div>
