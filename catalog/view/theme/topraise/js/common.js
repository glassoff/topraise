var ajaxProcess = false;
var showLoaderTime = 0;

$(function(){
    $('.tocart').click(function(){
        addToCart($(this).data('productid'));
    });

    $('.success img, .warning img, .attention img, .information img').live('click', function() {
        $(this).parent().fadeOut('slow', function() {
            $(this).remove();
        });
    });

    $(document).ajaxStart(function(){
        ajaxProcess = true;
        window.setTimeout(function(){
            if(ajaxProcess){
                showLoader();
                showLoaderTime = new Date().getTime();
            }
        }, 1000);

    });
    $(document).ajaxStop(function(){
        ajaxProcess = false;
        if((new Date().getTime()) - showLoaderTime > 1000){
            hideLoader();
        }
        else{
            window.setTimeout(function(){
                if(!ajaxProcess){
                    hideLoader();
                }
            }, 300);
        }
    });

});

function addToCart(product_id, quantity) {
    quantity = typeof(quantity) != 'undefined' ? quantity : 1;

    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: 'product_id=' + product_id + '&quantity=' + quantity,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information, .error').remove();

            if (json['redirect']) {
                location = json['redirect'];
            }

            if (json['success']) {
                $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                $('.success').fadeIn('slow');

                $('#cart-total').html(json['total']);

                $('#cart-total-price').html(json['total_price']);

                $('html, body').animate({ scrollTop: 0 }, 'slow');
            }
        }
    });
}

function showLoader()
{
    var html = $(document.documentElement);
    var body = $(document.body);
    var page = $('body');

    page.width(body.width());

    $('.overlay, .preloader').show();
    $('body').css('overflow', 'hidden');
}

function hideLoader()
{
    var page = $('body');

    page.width('');

    $('.overlay, .preloader').hide();
    $('body').css('overflow', 'visible');
}