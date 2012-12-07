$(function(){
    var filterElements = $('.filter-element');
    $('.filter-open').click(function(){
        filterElements.toggle(50);
    });

    $('.filter-item').live('click', function(){
        $(this).toggleClass('selected');
        filterGetResults();
    });

    $( "#slider-range" ).slider({
        range: true,
        step: 10,
        min: minPrice,
        max: maxPrice,
        values: [ $('#min-price').val(), $('#max-price').val() ],
        slide: function( event, ui ) {
            $('#min-price').val(ui.values[ 0 ]);
            $('#max-price').val(ui.values[ 1 ]);
        },
        change: function( event, ui ) {
            filterGetResults();
        }
    });

    $('[name="filterprice-min"]').change(function(){
        var val = parseInt($(this).val());
        if(val < minPrice){
            val = minPrice;
        }
        else if(val > parseInt($('[name="filterprice-max"]').val())){
            val = parseInt($('[name="filterprice-max"]').val());
        }
        $( "#slider-range" ).slider('values', 0, val);
        $(this).val(val);
    });
    $('[name="filterprice-max"]').change(function(){
        var val = parseInt($(this).val());
        if(val > maxPrice){
            val = maxPrice;
        }
        else if(val < parseInt($('[name="filterprice-min"]').val())){
            val = parseInt($('[name="filterprice-min"]').val());
        }
        $( "#slider-range" ).slider('values', 1, val);
        $(this).val(val);
    });

    function filterGetResults()
    {
        var data = {
            'category': currentCategory,
            'filterprice-min': $('[name="filterprice-min"]').val(),
            'filterprice-max': $('[name="filterprice-max"]').val()
        };
        $('.filter-item.selected').each(function(){
            var name = $(this).data('name');
            var value = $(this).data('value');
            if(typeof data[name] == 'undefined'){
                data[name] = [];
            }
            data[name].push(value);
        });

        if(addParams){
            data = $.extend(data, addParams);
        }

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
    }

});