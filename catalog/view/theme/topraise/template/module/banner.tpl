<?php if(count($banners) > 0): ?>
<?php
$count = count($banners);
$index = rand(0, $count - 1);
$banner = $banners[$index];
?>
<div class="page__banner"><a title="<?php echo $banner['title']; ?>" href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a></div>
<?php endif; ?>