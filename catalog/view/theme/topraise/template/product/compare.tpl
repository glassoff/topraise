<?php echo $header; ?>

<div class="center page">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div class="page__middle content content_compare">
        <h1 class="content__header"><?php echo $heading_title; ?></h1>

        <?php if ($products) { ?>

        <div class="compared">
            <div class="compared__col">
                <?php require('compare_table.tpl') ?>
            </div>
            <div class="compared__data">
                <?php require('compare_table.tpl') ?>
            </div>
            <a href="#" class="compared__button-left" id="compared-left"></a>
            <a href="#" class="compared__button-right" id="compared-right"></a>
        </div>

        <script>
            $(function(){
                var scrolled = $('.compared__data .compared-table');
                var scrolling = false;

                var windowWidth = $('.compared').width();
                var scrolledWidth = scrolled.width();

                $('#compared-left, #compared-right').mousedown(function(){
                    scrolling = true;
                    if($(this).is('#compared-left')){
                        scrollCompare('+=10');
                    }
                    else if($(this).is('#compared-right')){
                        scrollCompare('-=10');
                    }
                }).mouseup(function(){
                    scrolling = false;

                }).click(function(){
                    return false;
                });

                function scrollCompare(value)
                {
                    if(scrolling){
                        var left = parseInt(scrolled.css('left'));
                        eval('left'+value);
                        if( left > 0 || left < -(scrolledWidth - windowWidth) ){
                            scrolling = false;
                            return false;
                        }

                        var val = value + 'px';

                        scrolled.animate({'left': val}, 10, function(){
                            /*var left = parseInt(scrolled.css('left'));
                            if(left > -(scrolledWidth - windowWidth)){
                                $('#compared-left').show();
                            }
                            if(left <){
                                $('#compared-left').hide();
                            }*/

                            scrollCompare(value);
                        });
                    }
                }
            });
        </script>

        <div class="buttons">
            <div class="right"><a href="<?php echo $continue; ?>" class="button button_a button_green"><?php echo $button_continue; ?></a></div>
        </div>
        <?php } else { ?>
        <div class="content"><?php echo $text_empty; ?></div>
        <div class="buttons">
            <div class="right"><a href="<?php echo $continue; ?>" class="button button_a button_green"><?php echo $button_continue; ?></a></div>
        </div>
        <?php } ?>


    </div>
</div>

<?php echo $footer; ?>