-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 20 2012 г., 19:55
-- Версия сервера: 5.1.65
-- Версия PHP: 5.3.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `topraise`
--

-- --------------------------------------------------------

--
-- Структура таблицы `information`
--

DROP TABLE IF EXISTS `information`;
CREATE TABLE IF NOT EXISTS `information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `information`
--

INSERT INTO `information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, -1, 1),
(5, 1, 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `information_description`
--

DROP TABLE IF EXISTS `information_description`;
CREATE TABLE IF NOT EXISTS `information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `information_description`
--

INSERT INTO `information_description` (`information_id`, `language_id`, `title`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`) VALUES
(5, 1, 'Условия соглашения', '&lt;p&gt;\r\n	Условия соглашения&lt;/p&gt;\r\n', '', '', '', ''),
(3, 1, 'Политика Безопасности', '&lt;p&gt;\r\n	Политика Безопасности&lt;/p&gt;\r\n', '', '', '', ''),
(4, 1, 'О нас', '&lt;p&gt;\r\n	Мы специализированный интернет-магазин сантехники. У нас вы найдете самый большой выбор смесителей, аксессуаров и мебели для ванных комнат, стеклянных раковин, кухонных моек, зеркал и душевых кабин. На ваш выбор представлена эксклюзивная продукция на российском рынке сантехники — стеклянная мебель для ванных комнат, зеркала и раковины.&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	Продукции торговых марок которые мы предлагаем имеет современный дизайн, уютную конструкцию, проста в установке и использовании, высокое качество по разумной цене. Все создана с использованием высоких технологий для современной жизни. Продукция имеет сервисное обслуживание по установке, ремонту,&amp;nbsp; уходу. Товарный знак, упаковка, маркировка защищены патентным правом, имеют сертификаты качества, гигиенические сертификаты и другие сертификаты. Продукция реализуется по всей России, имеет хорошие отзывы&amp;nbsp; потребителей разных стран Мира, в том числе и в России.&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	Ознакомиться с полным ассортиментом нашего интернет-магазина Вы можете &lt;a href=&quot;/index.php?route=product/category&quot;&gt;здесь&lt;/a&gt;.&lt;br /&gt;\r\n	&lt;br /&gt;\r\n	Покупая нужный Вам товар в нашем интернет-магазине сантехники, вы экономите не только деньги, но и драгоценное время которого нам всем всегда не хватает!&lt;/p&gt;\r\n', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `information_to_layout`
--

DROP TABLE IF EXISTS `information_to_layout`;
CREATE TABLE IF NOT EXISTS `information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `information_to_store`
--

DROP TABLE IF EXISTS `information_to_store`;
CREATE TABLE IF NOT EXISTS `information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `information_to_store`
--

INSERT INTO `information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `remont`
--

DROP TABLE IF EXISTS `remont`;
CREATE TABLE IF NOT EXISTS `remont` (
  `remont_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) NOT NULL DEFAULT '0',
  `type` enum('equipment','water') COLLATE utf8_bin NOT NULL DEFAULT 'equipment',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `image_size` int(1) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`remont_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `remont`
--

INSERT INTO `remont` (`remont_id`, `status`, `type`, `image`, `image_size`, `date_added`) VALUES
(1, 1, 'water', 'data/1e5a8au-960.jpg', 0, '2012-11-17 21:49:09'),
(2, 1, 'equipment', 'data/test.jpg', 0, '2012-11-17 22:16:24'),
(3, 1, 'water', 'data/9ab61au-960.jpg', 0, '2012-11-17 22:17:52'),
(4, 1, 'equipment', 'data/2a0b2au-960.jpg', 0, '2012-11-17 22:18:20'),
(5, 1, 'equipment', 'data/18bd34u-960.jpg', 0, '2012-11-17 22:18:48'),
(6, 1, 'equipment', 'data/3c0b2au-960.jpg', 0, '2012-11-17 22:19:24'),
(7, 1, 'equipment', 'data/1b6902u-960.jpg', 0, '2012-11-17 22:19:56');

-- --------------------------------------------------------

--
-- Структура таблицы `remont_description`
--

DROP TABLE IF EXISTS `remont_description`;
CREATE TABLE IF NOT EXISTS `remont_description` (
  `remont_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`remont_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `remont_description`
--

INSERT INTO `remont_description` (`remont_id`, `language_id`, `title`, `meta_description`, `description`) VALUES
(1, 1, 'Ремонт раковины', '', '&lt;p&gt;\r\n	Ремонт раковины&lt;/p&gt;\r\n'),
(2, 1, 'Монтаж душевой кабинки Coliseum 7080', '', '&lt;p&gt;\r\n	Генеральный директор петербургского &quot;Зенита&quot; Максим Митрофанов заявил, что его команда может сняться с розыгрыша чемпионата России по футболу, если к ней будут применены излишне жестокие санкции после матча с &quot;Динамо&quot; в Химках. Об этом, как сообщает &lt;a href=&quot;http://www.interfax.ru/&quot; target=&quot;_blank&quot;&gt;&quot;Интерфакс&quot;&lt;/a&gt;, он заявил журналистам в субботу, 17 ноября.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Встреча в Химках была прервана на 37-й минуте, когда с гостевой трибуны во вратаря &quot;Динамо&quot; Антона Шунина была брошена петарда. Она взорвалась у него под ногой, после чего голкипера оглушило, и он упал, закрыв лицо руками. Арбитр прервал встречу, уведя команды с поля. Шунин был отправлен в Боткинскую больницу, предварительно ему диагностировали ожог роговицы.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Гендиректор &quot;Зенита&quot; осудил поведение болельщиков, но призвал не считать виновным в инциденте именно питерский клуб.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&quot;Реализацией билетов и допуском болельщиков на трибуны занималось &quot;Динамо&quot;, и нет доказательств, что на фанатском секторе находились только поклонники сине-бело-голубых, - заявил Максим Митрофанов. - &quot;Динамо&quot; пытается торпедировать ситуацию однозначно: виноват &quot;Зенит&quot;. Но если все будет так однозначно, акционеры &quot;Зенита&quot; могут задуматься о том, стоит ли продолжать участие в чемпионате России&quot;.&lt;/p&gt;\r\n'),
(3, 1, 'Израиль отбил ракетную атаку на Тель-Авив', '', '&lt;p&gt;\r\n	В субботу, 17 ноября, в Тель-Авиве были слышны звуки сирен воздушной тревоги, сообщает агентство &lt;a href=&quot;http://www.reuters.com/&quot; target=&quot;_blank&quot;&gt;Reuters&lt;/a&gt;. По словам местных жителей, они слышали звук взрыва, а над южным предместьем Тель-Авива видели облако дыма.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Как заявили представители армии обороны и полиции Израиля, залпом батареи системы ПВО &quot;Железный купол&quot; удалось сбить в воздухе нацеленную на город ракету. Ранее боевики движения &lt;a class=&quot;lp&quot; href=&quot;http://lenta.ru/lib/14160709/&quot;&gt;ХАМАС&lt;/a&gt; объявили, что они выпустили по Тель-Авиву очередную ракету.&lt;/p&gt;\r\n&lt;p&gt;\r\n	В среду, 14 ноября, Израиль начал в секторе Газа военно-воздушную операцию против ХАМАСа, поводом для которой послужили регулярные ракетные обстрелы израильской территории. Целями израильских ударов названы военные объекты и руководители ХАМАСа. 14 ноября погиб один из лидеров движения Ахмад Джабари.&lt;/p&gt;\r\n'),
(4, 1, 'При обстреле Газы убиты трое боевиков ХАМАС', '', '&lt;p&gt;\r\n	sdfdgfdhfgdhfg&lt;/p&gt;\r\n'),
(5, 1, '&quot;Спартак&quot; не сумел обыграть &quot;Волгу&quot; в чемпио', '', '&lt;h2&gt;\r\n	&quot;Спартак&quot; не сумел обыграть &quot;Волгу&quot; в чемпионате России&lt;/h2&gt;\r\n'),
(6, 1, 'На финской ферме застрелили трех человек', '', '&lt;p&gt;\r\n	вот так то&lt;/p&gt;\r\n'),
(7, 1, 'Министерство просвещения Молдавии извинилось за учителя-русофоба', '', '&lt;p&gt;\r\n	Молодцы че&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `remont_to_store`
--

DROP TABLE IF EXISTS `remont_to_store`;
CREATE TABLE IF NOT EXISTS `remont_to_store` (
  `remont_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`remont_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `remont_to_store`
--

INSERT INTO `remont_to_store` (`remont_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2818 ;

--
-- Дамп данных таблицы `setting`
--

INSERT INTO `setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(1132, 0, 'distance', 'distance_sort_order', '2', 0),
(1121, 0, 'pickup', 'pickup_status', '1', 0),
(1080, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(1079, 0, 'free_checkout', 'free_checkout_order_status_id', '14', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(1564, 0, 'news', 'news_popup_width', '310', 0),
(1563, 0, 'news', 'news_thumb_height', '136', 0),
(1562, 0, 'news', 'news_thumb_width', '310', 0),
(1561, 0, 'news', 'news_headline_chars', '500', 0),
(2603, 0, 'category', 'category_module', 'a:5:{i:0;a:5:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:1;a:5:{s:9:"layout_id";s:2:"11";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:2;a:5:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:3;a:5:{s:9:"layout_id";s:1:"8";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:4;a:5:{s:9:"layout_id";s:1:"4";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(2812, 0, 'remont', 'remont_headline_chars', '100', 0),
(1128, 0, 'distance', 'distance_rate', '100:400.00,200:500.00,500:1000.00,1000:1500.00', 0),
(2811, 0, 'config', 'config_google_analytics', '', 0),
(2810, 0, 'config', 'config_error_filename', 'error.txt', 0),
(2808, 0, 'config', 'config_error_display', '1', 0),
(2809, 0, 'config', 'config_error_log', '1', 0),
(1566, 0, 'news', 'news_headline_module', '0', 0),
(1565, 0, 'news', 'news_popup_height', '136', 0),
(1152, 0, 'flat', 'flat_sort_order', '1', 0),
(1151, 0, 'flat', 'flat_status', '1', 0),
(1150, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(1149, 0, 'flat', 'flat_tax_class_id', '0', 0),
(1148, 0, 'flat', 'flat_cost', '0', 0),
(2806, 0, 'config', 'config_encryption', 'dfbec5b4a36a9c39ddbe3cd1078e7929', 0),
(2807, 0, 'config', 'config_compression', '0', 0),
(2805, 0, 'config', 'config_maintenance', '0', 0),
(2804, 0, 'config', 'config_seo_url_postfix', '', 0),
(2803, 0, 'config', 'config_seo_url_include_path', '0', 0),
(2802, 0, 'config', 'config_seo_url_type', 'seo_url', 0),
(2801, 0, 'config', 'config_seo_url', '0', 0),
(1131, 0, 'distance', 'distance_status', '1', 0),
(2800, 0, 'config', 'config_use_ssl', '0', 0),
(56, 0, 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(2799, 0, 'config', 'config_sms_gate_password', '', 0),
(2798, 0, 'config', 'config_sms_gate_username', '', 0),
(60, 0, 'account', 'account_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(2797, 0, 'config', 'config_sms_message', '', 0),
(2796, 0, 'config', 'config_sms_copy', '', 0),
(2795, 0, 'config', 'config_sms_to', '', 0),
(2794, 0, 'config', 'config_sms_from', '', 0),
(2793, 0, 'config', 'config_sms_gatename', 'testsms', 0),
(2792, 0, 'config', 'config_sms_alert', '0', 0),
(2791, 0, 'config', 'config_fraud_status_id', '14', 0),
(2790, 0, 'config', 'config_fraud_score', '', 0),
(2789, 0, 'config', 'config_fraud_key', '', 0),
(2788, 0, 'config', 'config_fraud_detection', '0', 0),
(2787, 0, 'config', 'config_alert_emails', '', 0),
(2786, 0, 'config', 'config_account_mail', '0', 0),
(2785, 0, 'config', 'config_alert_mail', '1', 0),
(2784, 0, 'config', 'config_smtp_timeout', '5', 0),
(2783, 0, 'config', 'config_smtp_port', '25', 0),
(2782, 0, 'config', 'config_smtp_password', '', 0),
(2781, 0, 'config', 'config_smtp_username', '', 0),
(2780, 0, 'config', 'config_smtp_host', '', 0),
(2779, 0, 'config', 'config_mail_parameter', '', 0),
(2778, 0, 'config', 'config_mail_protocol', 'mail', 0),
(2777, 0, 'config', 'config_image_cart_height', '100', 0),
(2776, 0, 'config', 'config_image_cart_width', '59', 0),
(2775, 0, 'config', 'config_image_wishlist_height', '47', 0),
(2774, 0, 'config', 'config_image_wishlist_width', '47', 0),
(1130, 0, 'distance', 'distance_geo_zone_id', '0', 0),
(2772, 0, 'config', 'config_image_compare_width', '90', 0),
(2771, 0, 'config', 'config_image_related_height', '100', 0),
(2770, 0, 'config', 'config_image_related_width', '59', 0),
(2769, 0, 'config', 'config_image_additional_height', '74', 0),
(2768, 0, 'config', 'config_image_additional_width', '74', 0),
(1081, 0, 'free_checkout', 'free_checkout_sort_order', '', 0),
(2773, 0, 'config', 'config_image_compare_height', '90', 0),
(2767, 0, 'config', 'config_image_product_height', '230', 0),
(2766, 0, 'config', 'config_image_product_width', '130', 0),
(2765, 0, 'config', 'config_image_popup_height', '500', 0),
(2764, 0, 'config', 'config_image_popup_width', '500', 0),
(855, 0, 'bestseller', 'bestseller_module', 'a:1:{i:0;a:7:{s:5:"limit";s:2:"20";s:11:"image_width";s:3:"130";s:12:"image_height";s:3:"230";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(854, 0, 'latest', 'latest_module', 'a:1:{i:0;a:7:{s:5:"limit";s:2:"20";s:11:"image_width";s:3:"175";s:12:"image_height";s:3:"180";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(2762, 0, 'config', 'config_image_thumb_width', '120', 0),
(2763, 0, 'config', 'config_image_thumb_height', '230', 0),
(2761, 0, 'config', 'config_image_category_height', '80', 0),
(2760, 0, 'config', 'config_image_category_width', '80', 0),
(2759, 0, 'config', 'config_icon', '', 0),
(2758, 0, 'config', 'config_logo', 'data/logo.png', 0),
(2757, 0, 'config', 'config_return_status_id', '2', 0),
(2756, 0, 'config', 'config_commission', '5', 0),
(2755, 0, 'config', 'config_affiliate_id', '4', 0),
(2754, 0, 'config', 'config_stock_status_id', '5', 0),
(2753, 0, 'config', 'config_stock_checkout', '0', 0),
(2752, 0, 'config', 'config_stock_warning', '0', 0),
(2751, 0, 'config', 'config_stock_display', '0', 0),
(2750, 0, 'config', 'config_complete_status_id', '5', 0),
(2749, 0, 'config', 'config_order_status_id', '1', 0),
(2748, 0, 'config', 'config_invoice_prefix', 'INV-2012-00', 0),
(2747, 0, 'config', 'config_order_edit', '100', 0),
(2746, 0, 'config', 'config_checkout_id', '5', 0),
(2745, 0, 'config', 'config_guest_checkout', '1', 0),
(2744, 0, 'config', 'config_cart_weight', '0', 0),
(2743, 0, 'config', 'config_account_id', '3', 0),
(2742, 0, 'config', 'config_customer_price', '0', 0),
(2741, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(2740, 0, 'config', 'config_customer_group_id', '1', 0),
(2739, 0, 'config', 'config_tax_customer', 'shipping', 0),
(2738, 0, 'config', 'config_tax_default', 'shipping', 0),
(2737, 0, 'config', 'config_vat', '0', 0),
(2736, 0, 'config', 'config_tax', '0', 0),
(2735, 0, 'config', 'config_voucher_max', '1000', 0),
(2733, 0, 'config', 'config_upload_allowed', 'jpg, JPG, jpeg, gif, png, txt', 0),
(2734, 0, 'config', 'config_voucher_min', '1', 0),
(2732, 0, 'config', 'config_download', '0', 0),
(2731, 0, 'config', 'config_review_status', '0', 0),
(2730, 0, 'config', 'config_product_count', '0', 0),
(2729, 0, 'config', 'config_admin_limit', '20', 0),
(2728, 0, 'config', 'config_catalog_limit', '15', 0),
(2727, 0, 'config', 'config_weight_class_id', '1', 0),
(2726, 0, 'config', 'config_length_class_id', '1', 0),
(2725, 0, 'config', 'config_currency_auto', '1', 0),
(2724, 0, 'config', 'config_currency', 'RUB', 0),
(2723, 0, 'config', 'config_admin_language', 'ru', 0),
(2722, 0, 'config', 'config_language', 'ru', 0),
(2721, 0, 'config', 'config_zone_id', '2761', 0),
(2720, 0, 'config', 'config_country_id', '176', 0),
(2719, 0, 'config', 'config_layout_id', '4', 0),
(2718, 0, 'config', 'config_template', 'topraise', 0),
(2717, 0, 'config', 'config_meta_description', '', 0),
(2714, 0, 'config', 'config_fax', '', 0),
(2715, 0, 'config', 'config_map', '', 0),
(2716, 0, 'config', 'config_title', 'Top Raise - специализированный магазин сантехники', 0),
(2713, 0, 'config', 'config_telephone', '(3822) 65-65-82', 0),
(2712, 0, 'config', 'config_email', 'ooosefi@mail.ru', 0),
(2709, 0, 'config', 'config_owner', 'Мое Имя', 0),
(2710, 0, 'config', 'config_address', 'Россия, г. Томск, Иркутский проезд, 1', 0),
(2711, 0, 'config', 'config_times', 'работает с 09:00 до 18:00 часов\r\nв субботу с 10:00 до 17:00 часов\r\nв воскресенье с 10:00 до 14:00 часов', 0),
(2708, 0, 'config', 'config_name', 'Top Raise - специализированный магазин сантехники', 0),
(1129, 0, 'distance', 'distance_tax_class_id', '0', 0),
(1122, 0, 'pickup', 'pickup_sort_order', '0', 0),
(1120, 0, 'pickup', 'pickup_geo_zone_id', '0', 0),
(2602, 0, 'menu', 'menu_module', 'a:6:{i:0;a:4:{s:9:"layout_id";s:1:"8";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:1;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:2;a:4:{s:9:"layout_id";s:1:"4";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:3;a:4:{s:9:"layout_id";s:2:"11";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:4;a:4:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:5;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(2813, 0, 'remont', 'remont_thumb_width', '310', 0),
(2814, 0, 'remont', 'remont_thumb_height', '201', 0),
(2815, 0, 'remont', 'remont_popup_width', '310', 0),
(2816, 0, 'remont', 'remont_popup_height', '201', 0),
(2817, 0, 'remont', 'remont_headline_module', '0', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `store`
--

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
