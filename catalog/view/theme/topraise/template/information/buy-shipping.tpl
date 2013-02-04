<?php echo $header; ?>

<div class="center page" xmlns="http://www.w3.org/1999/html">
    <?php echo $content_top ?>
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
                            Можно выбрать конкретный товар из всего списка, а можно просто задать параметры товара в фильтре  - и вот он перед вами.
                        </p>
                        <br/>
                        <img src="catalog/view/theme/topraise/images/buy-shipping1.jpg" />
                        <br/>
                        <p>
                            В каталоге можно сравнить несколько товаров по функционалу и свойствам,  выбрать наиболее подходящий. Сделать это очень легко!
                        </p>
                        <br/>
                        <img src="catalog/view/theme/topraise/images/buy-shipping2.jpg" />
                        <br/>
                        <br/>
                        <a name="comfortable"></a>
                        <div class="buy-tabs__contents">
                            <img src="catalog/view/theme/topraise/images/buy-shipping-comf.jpg" />
                            <div class="buy-tabs__contents__txt">В нашем интернет-магазине вы приобретаете товары,  которые принесут  комфорт и умиротворение в ваш дом.</div>
                        </div>

                        <a name="economicly"></a>
                        <div class="buy-tabs__contents">
                            <img src="catalog/view/theme/topraise/images/buy-shipping-econ.jpg" />
                            <div class="buy-tabs__contents__txt">Приобретая любой товар у нас,  вы экономите. Нам не нужно снимать огромные помещения оборудованного специализированного магазина и платить персоналу. Вся наша продукция находится на складе-магазине. </div>
                        </div>
                        <br/>
                        <p>
                            Приобрести любой товар в нашем магазине можно так: выбрать понравившийся вам товар и нажать кн. «купить». Товар автоматически добавляется в вашу корзину. После этого вам необходимо перейти непосредственно в корзину и продолжить оформление заказа,  следуя предлагаемой схеме. Оплатить купленный товар можно наличными,  когда будете забирать его или при доставке курьеру.
                        </p>
                        <p>
                            При возникновении вопросов звоните нам! Квалифицированные специалисты ответят на любой Ваш вопрос. Также можно задать любой вопрос онлайн-консультанту.
                        </p>
                        <p>
                            Желаем вам приятной покупки.
                        </p>

                    </div>
                    <div id="shipping">
                        <p>Доставка в пределах г. Томска осуществляется бесплатно.</p>

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