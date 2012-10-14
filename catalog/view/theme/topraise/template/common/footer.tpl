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
                <h5 class="footer-icon footer-icon_delivery"><a href="">ДОСТАВКА</a></h5>
                <h5 class="footer-icon footer-icon_how-buy"><a href="">КАК КУПИТЬ</a></h5>
                <h5 class="footer-icon footer-icon_actions"><a href="">ВСЕ АКЦИИ</a></h5>
                <h5 class="footer-icon footer-icon_all-news"><a href="">ВСЕ НОВОСТИ</a></h5>
            </div>
            <div class="footer__top__contacts">
                <p>
                    Наш адрес Магазин-склад<br>
                    Россия, г. Томск, Иркутский проезд, 1
                </p>
                <p>
                    Есть вопросы? Звоните<br>
                    <span class="footer__top__contacts__phone">(3822)65-65-82</span>
                </p>
                <p>
                    <span class="footer__top__contacts__email">ooosefi@mail.ru</span>
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
</body>
</html>