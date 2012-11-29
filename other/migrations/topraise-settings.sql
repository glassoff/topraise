-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 29 2012 г., 10:05
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
-- Структура таблицы `extension`
--

DROP TABLE IF EXISTS `extension`;
CREATE TABLE IF NOT EXISTS `extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=456 ;

--
-- Дамп данных таблицы `extension`
--

INSERT INTO `extension` (`extension_id`, `type`, `code`) VALUES
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(59, 'total', 'total'),
(431, 'module', 'bestseller'),
(444, 'shipping', 'distance'),
(455, 'module', 'remont'),
(454, 'module', 'menu'),
(430, 'module', 'category'),
(411, 'module', 'affiliate'),
(408, 'module', 'account'),
(451, 'module', 'news'),
(438, 'payment', 'free_checkout'),
(447, 'shipping', 'flat'),
(432, 'module', 'latest'),
(445, 'shipping', 'distance'),
(446, 'shipping', 'pickup');

-- --------------------------------------------------------

--
-- Структура таблицы `layout`
--

DROP TABLE IF EXISTS `layout`;
CREATE TABLE IF NOT EXISTS `layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `layout`
--

INSERT INTO `layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information');

-- --------------------------------------------------------

--
-- Структура таблицы `layout_route`
--

DROP TABLE IF EXISTS `layout_route`;
CREATE TABLE IF NOT EXISTS `layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `layout_route`
--

INSERT INTO `layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(30, 6, 0, 'account'),
(17, 10, 0, 'affiliate/'),
(29, 3, 0, 'product/category'),
(26, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(22, 5, 0, 'product/manufacturer'),
(23, 7, 0, 'checkout/'),
(31, 8, 0, 'information/contact');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3246 ;

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
(3245, 0, 'news', 'news_headline_module', '0', 0),
(3244, 0, 'news', 'news_popup_height', '136', 0),
(3243, 0, 'news', 'news_popup_width', '310', 0),
(3242, 0, 'news', 'news_thumb_height', '136', 0),
(2603, 0, 'category', 'category_module', 'a:5:{i:0;a:5:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:1;a:5:{s:9:"layout_id";s:2:"11";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:2;a:5:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:3;a:5:{s:9:"layout_id";s:1:"8";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:4;a:5:{s:9:"layout_id";s:1:"4";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(2812, 0, 'remont', 'remont_headline_chars', '100', 0),
(1128, 0, 'distance', 'distance_rate', '100:400.00,200:500.00,500:1000.00,1000:1500.00', 0),
(3232, 0, 'config', 'config_error_filename', 'error.txt', 0),
(3233, 0, 'config', 'config_google_analytics', '', 0),
(3241, 0, 'news', 'news_thumb_width', '310', 0),
(3240, 0, 'news', 'news_headline_chars', '300', 0),
(1152, 0, 'flat', 'flat_sort_order', '1', 0),
(1151, 0, 'flat', 'flat_status', '1', 0),
(1150, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(1149, 0, 'flat', 'flat_tax_class_id', '0', 0),
(1148, 0, 'flat', 'flat_cost', '0', 0),
(3227, 0, 'config', 'config_maintenance', '0', 0),
(3231, 0, 'config', 'config_error_log', '1', 0),
(3230, 0, 'config', 'config_error_display', '1', 0),
(3229, 0, 'config', 'config_compression', '0', 0),
(1131, 0, 'distance', 'distance_status', '1', 0),
(3228, 0, 'config', 'config_encryption', 'dfbec5b4a36a9c39ddbe3cd1078e7929', 0),
(56, 0, 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(3226, 0, 'config', 'config_seo_url_postfix', '', 0),
(60, 0, 'account', 'account_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(3225, 0, 'config', 'config_seo_url_include_path', '0', 0),
(3224, 0, 'config', 'config_seo_url_type', 'seo_url', 0),
(3222, 0, 'config', 'config_use_ssl', '0', 0),
(3223, 0, 'config', 'config_seo_url', '0', 0),
(3221, 0, 'config', 'config_sms_gate_password', '', 0),
(3220, 0, 'config', 'config_sms_gate_username', '', 0),
(3219, 0, 'config', 'config_sms_message', '', 0),
(3217, 0, 'config', 'config_sms_to', '', 0),
(3218, 0, 'config', 'config_sms_copy', '', 0),
(3216, 0, 'config', 'config_sms_from', '', 0),
(3214, 0, 'config', 'config_sms_alert', '0', 0),
(3215, 0, 'config', 'config_sms_gatename', 'testsms', 0),
(3213, 0, 'config', 'config_fraud_status_id', '14', 0),
(3212, 0, 'config', 'config_fraud_score', '', 0),
(3211, 0, 'config', 'config_fraud_key', '', 0),
(1130, 0, 'distance', 'distance_geo_zone_id', '0', 0),
(3210, 0, 'config', 'config_fraud_detection', '0', 0),
(3209, 0, 'config', 'config_alert_emails', '', 0),
(3208, 0, 'config', 'config_account_mail', '0', 0),
(3207, 0, 'config', 'config_alert_mail', '1', 0),
(3206, 0, 'config', 'config_smtp_timeout', '5', 0),
(1081, 0, 'free_checkout', 'free_checkout_sort_order', '', 0),
(3205, 0, 'config', 'config_smtp_port', '25', 0),
(3204, 0, 'config', 'config_smtp_password', '', 0),
(3203, 0, 'config', 'config_smtp_username', '', 0),
(3202, 0, 'config', 'config_smtp_host', '', 0),
(855, 0, 'bestseller', 'bestseller_module', 'a:1:{i:0;a:7:{s:5:"limit";s:2:"20";s:11:"image_width";s:3:"130";s:12:"image_height";s:3:"230";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(854, 0, 'latest', 'latest_module', 'a:1:{i:0;a:7:{s:5:"limit";s:2:"20";s:11:"image_width";s:3:"175";s:12:"image_height";s:3:"180";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(3200, 0, 'config', 'config_mail_protocol', 'mail', 0),
(3201, 0, 'config', 'config_mail_parameter', '', 0),
(3199, 0, 'config', 'config_image_cart_height', '100', 0),
(3196, 0, 'config', 'config_image_wishlist_width', '47', 0),
(3197, 0, 'config', 'config_image_wishlist_height', '47', 0),
(3198, 0, 'config', 'config_image_cart_width', '59', 0),
(3195, 0, 'config', 'config_image_compare_height', '90', 0),
(3194, 0, 'config', 'config_image_compare_width', '90', 0),
(3193, 0, 'config', 'config_image_related_height', '100', 0),
(3192, 0, 'config', 'config_image_related_width', '59', 0),
(3191, 0, 'config', 'config_image_additional_height', '74', 0),
(3190, 0, 'config', 'config_image_additional_width', '74', 0),
(3189, 0, 'config', 'config_image_product_height', '230', 0),
(3188, 0, 'config', 'config_image_product_width', '130', 0),
(3187, 0, 'config', 'config_image_popup_height', '500', 0),
(3186, 0, 'config', 'config_image_popup_width', '500', 0),
(3185, 0, 'config', 'config_image_thumb_height', '230', 0),
(3184, 0, 'config', 'config_image_thumb_width', '120', 0),
(3183, 0, 'config', 'config_image_category_height', '80', 0),
(3181, 0, 'config', 'config_icon', '', 0),
(3182, 0, 'config', 'config_image_category_width', '80', 0),
(3180, 0, 'config', 'config_logo', 'data/logo.png', 0),
(3179, 0, 'config', 'config_return_status_id', '2', 0),
(3178, 0, 'config', 'config_commission', '5', 0),
(3177, 0, 'config', 'config_affiliate_id', '4', 0),
(3176, 0, 'config', 'config_stock_status_id', '5', 0),
(3175, 0, 'config', 'config_stock_checkout', '0', 0),
(3174, 0, 'config', 'config_stock_warning', '0', 0),
(3171, 0, 'config', 'config_order_status_id', '1', 0),
(3172, 0, 'config', 'config_complete_status_id', '5', 0),
(3173, 0, 'config', 'config_stock_display', '0', 0),
(3170, 0, 'config', 'config_invoice_prefix', 'INV-2012-00', 0),
(3169, 0, 'config', 'config_order_edit', '100', 0),
(3168, 0, 'config', 'config_checkout_id', '5', 0),
(3167, 0, 'config', 'config_guest_checkout', '1', 0),
(3166, 0, 'config', 'config_cart_weight', '0', 0),
(3165, 0, 'config', 'config_account_id', '3', 0),
(3164, 0, 'config', 'config_customer_price', '0', 0),
(3163, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(3160, 0, 'config', 'config_tax_default', 'shipping', 0),
(3161, 0, 'config', 'config_tax_customer', 'shipping', 0),
(1129, 0, 'distance', 'distance_tax_class_id', '0', 0),
(1122, 0, 'pickup', 'pickup_sort_order', '0', 0),
(1120, 0, 'pickup', 'pickup_geo_zone_id', '0', 0),
(2602, 0, 'menu', 'menu_module', 'a:6:{i:0;a:4:{s:9:"layout_id";s:1:"8";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:1;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:2;a:4:{s:9:"layout_id";s:1:"4";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:3;a:4:{s:9:"layout_id";s:2:"11";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:4;a:4:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:5;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(2813, 0, 'remont', 'remont_thumb_width', '310', 0),
(2814, 0, 'remont', 'remont_thumb_height', '201', 0),
(2815, 0, 'remont', 'remont_popup_width', '310', 0),
(2816, 0, 'remont', 'remont_popup_height', '201', 0),
(2817, 0, 'remont', 'remont_headline_module', '0', 0),
(3162, 0, 'config', 'config_customer_group_id', '1', 0),
(3159, 0, 'config', 'config_vat', '0', 0),
(3158, 0, 'config', 'config_tax', '0', 0),
(3155, 0, 'config', 'config_upload_allowed', 'jpg, JPG, jpeg, gif, png, txt', 0),
(3157, 0, 'config', 'config_voucher_max', '1000', 0),
(3156, 0, 'config', 'config_voucher_min', '1', 0),
(3154, 0, 'config', 'config_download', '0', 0),
(3153, 0, 'config', 'config_review_status', '0', 0),
(3152, 0, 'config', 'config_product_count', '0', 0),
(3151, 0, 'config', 'config_admin_limit', '20', 0),
(3150, 0, 'config', 'config_catalog_limit', '6', 0),
(3149, 0, 'config', 'config_weight_class_id', '1', 0),
(3148, 0, 'config', 'config_length_class_id', '1', 0),
(3147, 0, 'config', 'config_currency_auto', '1', 0),
(3143, 0, 'config', 'config_zone_id', '2761', 0),
(3144, 0, 'config', 'config_language', 'ru', 0),
(3145, 0, 'config', 'config_admin_language', 'ru', 0),
(3146, 0, 'config', 'config_currency', 'RUB', 0),
(3142, 0, 'config', 'config_country_id', '176', 0),
(3141, 0, 'config', 'config_layout_id', '4', 0),
(3140, 0, 'config', 'config_template', 'topraise', 0),
(3136, 0, 'config', 'config_fax', '', 0),
(3137, 0, 'config', 'config_map', '', 0),
(3138, 0, 'config', 'config_title', 'Top Raise - специализированный магазин сантехники', 0),
(3139, 0, 'config', 'config_meta_description', '', 0),
(3134, 0, 'config', 'config_email', 'ooosefi@mail.ru', 0),
(3135, 0, 'config', 'config_telephone', '(3822) 65-65-82', 0),
(3133, 0, 'config', 'config_times', 'работает с 09:00 до 18:00 часов\r\nв субботу с 10:00 до 17:00 часов\r\nв воскресенье с 10:00 до 14:00 часов', 0),
(3132, 0, 'config', 'config_address', 'Россия, г. Томск, Иркутский проезд, 1', 0),
(3131, 0, 'config', 'config_owner', 'Мое Имя', 0),
(3130, 0, 'config', 'config_name', 'Top Raise - специализированный магазин сантехники', 0);
