<?php

function productsFormat($count)
{
    $c = $count % 10;

    if($c == 1){
        return 'товар';
    }
    elseif($c > 1 && $c < 5){
        return 'товара ';
    }
    elseif($c >= 5 || $c == 0){
        return 'товаров';
    }
}

?>