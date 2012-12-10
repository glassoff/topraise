<?php echo $header; ?>

<div class="center page" xmlns="http://www.w3.org/1999/html">
    <div class="page__banner"><a href=""><img src="catalog/view/theme/topraise/images/banner.jpg"/></a></div>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content">
            <h1 class="content__header"><?php echo $heading_title; ?></h1>

            <div class="buy-shipping">
                <div class="buy-shipping__tabs__headers tabs">
                    <a href="#buy"><span>Покупка</span></a>
                    <a href="#shipping"><span>Доставка</span></a>
                </div>

                <div class="buy-shipping__tabs__contents">
                    <div id="buy">
                        <a name="simple"></a>
                        <div class="buy-tabs__contents">
                            <img src="catalog/view/theme/topraise/images/buy-shipping-simple.jpg" />
                            <div class="buy-tabs__contents__txt">В нашем интернет-магазине очень просто выбрать и приобрести любой товар.</div>
                        </div>
                        <p>
                            Для того, чтобы выбрать товар необходимо зайти на вкладку «Каталог». Далее выбрать нужную вам категорию и нажать на нее затем выбрать интересующий вас товар.
                        </p>
                        <p>
                            Конкретный товар можно выбрать из всего списка, а можно просто задать параметры товара в фильтре и вот он перед вами.
                        </p>
                        <br/>
                        <img src="catalog/view/theme/topraise/images/buy-shipping1.jpg" />
                        <br/>
                        <p>
                            В каталоге можно сравнить несколько товаров по функционалу и свойствах и выбрать более подходящий и это тоже сделать очень легко.
                        </p>
                        <br/>
                        <img src="catalog/view/theme/topraise/images/buy-shipping2.jpg" />
                        <br/>
                        <br/>
                        <a name="comfortable"></a>
                        <div class="buy-tabs__contents">
                            <img src="catalog/view/theme/topraise/images/buy-shipping-comf.jpg" />
                            <div class="buy-tabs__contents__txt">В нашем интернет-магазине вы преобритаете товары которые подарят вам комфорт и умиротворение в ваш дом.</div>
                        </div>

                        <a name="economicly"></a>
                        <div class="buy-tabs__contents">
                            <img src="catalog/view/theme/topraise/images/buy-shipping-econ.jpg" />
                            <div class="buy-tabs__contents__txt">Приобретая любой товар в нашем интернет-магазине вы экономите. Так как нам не нужно снимать агромные помещения оборудованного специализированного магазина и платить персоналу. Весь товар содержит наш склад-магазин в котором комфортно распологается вся продукция.</div>
                        </div>
                        <br/>
                        <p>
                            Приобрести любой товар в нашем интернет-магазине можно так:
                            Выбрать понравившейся вам товар и нажать кн. «купить», он автоматически добавляется в вашу корзину.
                            После этого вам необходимо перейти на страничку корзины и продолжить оформление товара следуя предлагаемой схеме.
                            Оплатить купленный товар можно наличными когда будете забирать товар или при доставке курьеру. Если есть вопросы можно позвонить нам и квалифицированный персонал ответит вам на любой вопрос.
                            Также вы можете задать любой вопрос в любое время через онлайн-консультант.


                        </p>
                        <p>
                            Желаем вам приятной покупки.
                        </p>

                    </div>
                    <div id="shipping">
                        <p>Доставка в пределах г. Томска и г. Северска осуществляется бесплатно.</p>

                        <p>Стоимость доставки в пригород г. Томска и другие населенные пункты Томской области необходимо уточнить у менеджера при подтверждении вашего заказа.</p>

                        <p>При покупке со склада: доставка осуществляется в течение 1 рабочего дня.</p>

                        <p>При заказе: доставка осуществляется в течение 7-10 рабочих дней.</p>
                    </div>
                </div>
            </div>


            <script>
                $(function(){
                    $('.tabs a').tabs();
                    <?php if($tab): ?>
                    $('[href="#<?php echo $tab?>"]').trigger('click');
                    <?php endif; ?>
                });
            </script>

        </div>
    </div>
</div>

<?php echo $footer; ?>