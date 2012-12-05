$(function(){
    var filterElements = $('.filter-element');
    $('.filter-open').click(function(){
        filterElements.toggle(50);
    });

    $('.filter-item').live('click', function(){
        $(this).toggleClass('selected');
        var data = {
            'category': currentCategory
        };
        $('.filter-item.selected').each(function(){
            var name = $(this).data('name');
            var value = $(this).data('value');
            if(typeof data[name] == 'undefined'){
                data[name] = [];
            }
            data[name].push(value);
        });
        $.ajax({
            url: filterUrl,
            type: 'get',
            dataType: 'json',
            data: data,
            success: function(data){
                if(data.result == 'ok'){
                    $('.filter-result').html(data.html);
                    if(data.count > 0){

                    }
                }
            }
        });
    });
});