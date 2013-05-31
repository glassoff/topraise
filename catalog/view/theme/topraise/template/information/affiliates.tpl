<?php echo $header; ?>

<div class="center page">
    <?php echo $content_top ?>
    <div class="page__middle">

        <?php echo $column_left; ?>

        <div class="page__middle__right content affiliates-page">
            <h1 class="content__header"><?php echo $heading_title; ?></h1>

            <div class="tip tip_down">
                <div class="tip__content" style="padding:20px;">
                    Выберите интересующее вас представительство и кликнете по нему, чтобы посмотреть его местоположение
                </div>
            </div>

            <ul class="affiliates-page__list">
                <?php foreach($affiliates as $affiliate): ?>
                <?php if(!$affiliate['status']) continue; ?>
                <li class="affiliates-page__list__item affiliate-item" data-address="<?php echo $affiliate['address'] ?>">
                    <div class="affiliates-page__list__item__wrapper">
                        <div class="affiliates-page__list__item__sel"></div>
                        <table class="affiliate-item-table">
                            <tr>
                                <td class="affiliate-item-table__title-td"><span class="pseudo-a"><?php echo $affiliate['town'] ?></span></td>
                                <td class="affiliate-item-table__address-td">
                                    <p><?php echo nl2br($affiliate['address']) ?></p>
                                    <p><?php echo nl2br($affiliate['name']) ?></p>
                                    <p><?php echo nl2br($affiliate['contacts']) ?></p>
                                </td>
                                <td class="affiliate-item-table__times-td">
                                    <p>График работы:</p>
                                    <?php echo nl2br($affiliate['times']) ?>
                                </td>
                            </tr>
                        </table>
                    </div>
                </li>
                <?php endforeach; ?>
            </ul>


            <div id="map" class="affiliates-page__map">
                <img src="catalog/view/theme/topraise/images/loader.gif" />
                <!-- map -->
            </div>

            <script type="text/javascript">
                var ymap;

                function showAffiliate(el){
                    $('.affiliate-item').removeClass('selected');
                    $(el).addClass('selected');

                    var address = $(el).data('address');

                    var myGeocoder = ymaps.geocode(address);
                    myGeocoder.then(
                            function (res) {
                                ymap.setCenter(res.geoObjects.get(0).geometry.getCoordinates(), 16);
                                var myPlacemark = new ymaps.Placemark(res.geoObjects.get(0).geometry.getCoordinates());
                                ymap.geoObjects.add(myPlacemark);
                            },
                            function (err) {

                            }
                    );
                }

                $(function(){
                    ymaps.ready(function(){
                        $('#map').empty();
                        ymap = new ymaps.Map("map", {
                            center: [0, 0],
                            zoom: 16,
                            type: "yandex#publicMap"
                        });
                        ymap.controls.add('mapTools');
                        ymap.controls.add('typeSelector');
                        ymap.controls.add('zoomControl');

                        showAffiliate($('.affiliate-item:first'));
                        $('.affiliate-item').click(function(){
                            showAffiliate(this);
                        });

                    });

                });
            </script>

        </div>
    </div>
</div>

<?php echo $footer; ?>