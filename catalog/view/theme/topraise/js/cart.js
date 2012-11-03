$(function(){
    var interval;
    $('[name^="quantity"]').live('focus', function(){
        var input = $(this);
        var val = $(input).val();
        interval = window.setInterval(function(){
            var newVal = $(input).val();
            if(newVal != val){
                //update cart
                updateCart();
            }
            val = newVal;
        }, 500);
    }).live('blur', function(){
        window.clearInterval(interval);
    });


    $('.cart-checkbox').live('click', function(){
        var key = $(this).data('productid');
        var input = $('[name="quantity['+key+']"]');

        if(input.val() > 0){
            $(this).removeClass('cart-table__checkbox_active');
            input.val(0);
        }
        else{
            $(this).addClass('cart-table__checkbox_active');
            var prevValue = $('[name="prevquantity['+key+']"]').val();
            prevValue = prevValue > 0 ? prevValue : 1;
            input.val( prevValue );
        }

        updateCart();
    });


    $('.cart-delete').live('click', function(){
        $('#cart-body').load($(this).attr('href'), function(data){
            onCartUpdate(data);
        });
        return false;
    });

    var disabledNext = false;

    $('[name=shipping_method]').live('click', function(){
        $.ajax({
            url: 'index.php?route=checkout/shipping_method/validate',
            data: $(this).add($('#shipping-comment')),
            type: 'post',
            dataType: 'json',
            success: function(json){
                if(json['redirect']){
                    disabledNext = true;
                    disableNext();
                }
                else if (json['error']){
                    if (json['error']['warning']) {
                        $('#shipping-method').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                        $('.warning').fadeIn('slow');
                    }
                }
                else{
                    disabledNext = false;
                }
                updateCart();
            }
        });
    });
    $('[name=shipping_method]:checked').trigger('click');


    $(document).ajaxStart(function(){
        disableNext();
    });
    $(document).ajaxStop(function(){
        enableNext();
    });


    $('#next-button').live('click', function(){
        return !disabledNext;
    });

    function disableNext()
    {
        $('#next-button').addClass('content_checkout__button_disabled').attr('disabled', 'disabled');
        disabledNext = true;
    }

    function enableNext()
    {
        if(!disabledNext){
            $('#next-button').removeClass('content_checkout__button_disabled').attr('disabled', '');
        }

    }


    function updateCart()
    {
        var form = $('#cart-form');

        $.ajax({
            url: form.attr('action'),
            type: 'POST',
            data: form.serializeArray(),
            success: function(data){
                $('#cart-body').html(data);
                onCartUpdate(data);
            }
        });
    }

    function onCartUpdate(data)
    {
        $('#cart-total').html(cartCount);
        $('#cart-total-price').html(cartTotal);

        //$('[name=shipping_method]:checked').trigger('click');
        if(hasError){
            disabledNext = true;
            disableNext();
        }
        else{
            disabledNext = false;
        }
    }

});