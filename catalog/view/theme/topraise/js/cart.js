$(function(){
    var interval;
    $('[name^="quantity"]').live('focus', function(){
        var input = $(this);
        var val = $(input).val();
        interval = window.setInterval(function(){
            var newVal = $(input).val();
            if(newVal != val){
                //update cart
                var form = $(input).parents('form');
                $.ajax({
                    url: form.attr('action'),
                    type: 'POST',
                    data: form.serializeArray(),
                    success: function(data){
                        $('#cart-body').html(data);
                    }
                });
            }
            val = newVal;
        }, 500);
    }).live('blur', function(){
        window.clearInterval(interval);
    });

});