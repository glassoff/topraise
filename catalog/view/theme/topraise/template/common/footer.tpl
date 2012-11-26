</div>
<div class="g-footer">
    <div class="footer">
        <div class="footer__top">
            <div class="footer__top__catalog">
                <h5 class="footer-icon">КАТАЛОГ</h5>
                <ul>
                    <?php foreach($categories as $category): ?>
                    <li><a href="<?php echo $category['href'] ?>"><?php echo $category['title'] ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </div>
            <div class="footer__top__links">
                <h5 class="footer-icon footer-icon_delivery"><a href="<?php echo $delivery_href ?>">ДОСТАВКА</a></h5>
                <h5 class="footer-icon footer-icon_how-buy"><a href="<?php echo $howbuy_href ?>">КАК КУПИТЬ</a></h5>
                <h5 class="footer-icon footer-icon_actions"><a href="<?php echo $actions_href ?>">ВСЕ АКЦИИ</a></h5>
                <h5 class="footer-icon footer-icon_all-news"><a href="<?php echo $news_href ?>">ВСЕ НОВОСТИ</a></h5>
            </div>
            <div class="footer__top__contacts">
                <p>
                    Наш адрес Магазин-склад<br>
                    <?php echo $address ?>
                </p>
                <p>
                    Есть вопросы? Звоните<br>
                    <span class="footer__top__contacts__phone"><?php echo $telephone ?></span>
                </p>
                <p>
                    <span class="footer__top__contacts__email"><?php echo $email ?></span>
                </p>
            </div>
        </div>
        <div class="footer__bottom">
            <div class="footer__bottom__left">
                &copy; 2012 Top raise All rights reserved
            </div>
            <div class="footer__bottom__right">
                Разработано в <a href="">AltaLab</a> Branding & I. C. laboratory
            </div>
        </div>
    </div>
</div>
</div>

<div class="overlay"></div>
<div class="preloader"><img src="catalog/view/theme/topraise/images/loader.gif"/></div>

</body>
</html>