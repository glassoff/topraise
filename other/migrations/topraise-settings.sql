-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 18 2012 г., 22:47
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3878 ;

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
(3241, 0, 'news', 'news_thumb_width', '310', 0),
(3240, 0, 'news', 'news_headline_chars', '300', 0),
(1152, 0, 'flat', 'flat_sort_order', '1', 0),
(1151, 0, 'flat', 'flat_status', '1', 0),
(1150, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(1149, 0, 'flat', 'flat_tax_class_id', '0', 0),
(1148, 0, 'flat', 'flat_cost', '0', 0),
(3868, 0, 'config', 'config_seo_url_include_path', '0', 0),
(1131, 0, 'distance', 'distance_status', '1', 0),
(3869, 0, 'config', 'config_seo_url_postfix', '', 0),
(3559, 0, 'banner', 'banner_module', 'a:6:{i:0;a:7:{s:9:"banner_id";s:1:"9";s:5:"width";s:4:"1000";s:6:"height";s:2:"71";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:1;a:7:{s:9:"banner_id";s:1:"9";s:5:"width";s:4:"1000";s:6:"height";s:2:"71";s:9:"layout_id";s:1:"7";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:2;a:7:{s:9:"banner_id";s:1:"9";s:5:"width";s:4:"1000";s:6:"height";s:2:"71";s:9:"layout_id";s:1:"8";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:3;a:7:{s:9:"banner_id";s:1:"9";s:5:"width";s:4:"1000";s:6:"height";s:2:"71";s:9:"layout_id";s:1:"4";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:4;a:7:{s:9:"banner_id";s:1:"9";s:5:"width";s:4:"1000";s:6:"height";s:2:"71";s:9:"layout_id";s:2:"11";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:5;a:7:{s:9:"banner_id";s:1:"9";s:5:"width";s:4:"1000";s:6:"height";s:2:"71";s:9:"layout_id";s:1:"2";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(3867, 0, 'config', 'config_seo_url_type', 'seo_url', 0),
(3865, 0, 'config', 'config_use_ssl', '0', 0),
(3866, 0, 'config', 'config_seo_url', '0', 0),
(3864, 0, 'config', 'config_sms_gate_password', '', 0),
(3863, 0, 'config', 'config_sms_gate_username', '', 0),
(3862, 0, 'config', 'config_sms_message', '', 0),
(3861, 0, 'config', 'config_sms_copy', '', 0),
(3860, 0, 'config', 'config_sms_to', '', 0),
(3859, 0, 'config', 'config_sms_from', '', 0),
(1130, 0, 'distance', 'distance_geo_zone_id', '0', 0),
(3858, 0, 'config', 'config_sms_gatename', 'testsms', 0),
(3857, 0, 'config', 'config_sms_alert', '0', 0),
(3856, 0, 'config', 'config_fraud_status_id', '14', 0),
(1081, 0, 'free_checkout', 'free_checkout_sort_order', '', 0),
(3854, 0, 'config', 'config_fraud_key', '', 0),
(3855, 0, 'config', 'config_fraud_score', '', 0),
(3852, 0, 'config', 'config_alert_emails', '', 0),
(3770, 0, 'bestseller', 'bestseller_module', 'a:1:{i:0;a:7:{s:5:"limit";s:2:"20";s:11:"image_width";s:3:"130";s:12:"image_height";s:3:"230";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(3771, 0, 'latest', 'latest_module', 'a:1:{i:0;a:7:{s:5:"limit";s:2:"20";s:11:"image_width";s:3:"175";s:12:"image_height";s:3:"180";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(3853, 0, 'config', 'config_fraud_detection', '0', 0),
(3851, 0, 'config', 'config_account_mail', '0', 0),
(3850, 0, 'config', 'config_alert_mail', '1', 0),
(3849, 0, 'config', 'config_smtp_timeout', '5', 0),
(3848, 0, 'config', 'config_smtp_port', '25', 0),
(3847, 0, 'config', 'config_smtp_password', '', 0),
(3846, 0, 'config', 'config_smtp_username', '', 0),
(3845, 0, 'config', 'config_smtp_host', '', 0),
(3844, 0, 'config', 'config_mail_parameter', '', 0),
(3843, 0, 'config', 'config_mail_protocol', 'mail', 0),
(3842, 0, 'config', 'config_image_cart_height', '100', 0),
(3841, 0, 'config', 'config_image_cart_width', '59', 0),
(3840, 0, 'config', 'config_image_wishlist_height', '47', 0),
(3839, 0, 'config', 'config_image_wishlist_width', '47', 0),
(3837, 0, 'config', 'config_image_compare_width', '59', 0),
(3838, 0, 'config', 'config_image_compare_height', '100', 0),
(3836, 0, 'config', 'config_image_related_height', '100', 0),
(3835, 0, 'config', 'config_image_related_width', '59', 0),
(3834, 0, 'config', 'config_image_additional_height', '74', 0),
(3833, 0, 'config', 'config_image_additional_width', '74', 0),
(3832, 0, 'config', 'config_image_product_height', '230', 0),
(3830, 0, 'config', 'config_image_popup_height', '500', 0),
(3831, 0, 'config', 'config_image_product_width', '130', 0),
(3829, 0, 'config', 'config_image_popup_width', '500', 0),
(3828, 0, 'config', 'config_image_thumb_height', '230', 0),
(3827, 0, 'config', 'config_image_thumb_width', '120', 0),
(3824, 0, 'config', 'config_icon', '', 0),
(3825, 0, 'config', 'config_image_category_width', '80', 0),
(3826, 0, 'config', 'config_image_category_height', '80', 0),
(3822, 0, 'config', 'config_return_status_id', '2', 0),
(1129, 0, 'distance', 'distance_tax_class_id', '0', 0),
(1122, 0, 'pickup', 'pickup_sort_order', '0', 0),
(1120, 0, 'pickup', 'pickup_geo_zone_id', '0', 0),
(2602, 0, 'menu', 'menu_module', 'a:6:{i:0;a:4:{s:9:"layout_id";s:1:"8";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:1;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:2;a:4:{s:9:"layout_id";s:1:"4";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:3;a:4:{s:9:"layout_id";s:2:"11";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:4;a:4:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:5;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(2813, 0, 'remont', 'remont_thumb_width', '310', 0),
(2814, 0, 'remont', 'remont_thumb_height', '201', 0),
(2815, 0, 'remont', 'remont_popup_width', '310', 0),
(2816, 0, 'remont', 'remont_popup_height', '201', 0),
(2817, 0, 'remont', 'remont_headline_module', '0', 0),
(3823, 0, 'config', 'config_logo', 'data/logo.png', 0),
(3821, 0, 'config', 'config_commission', '5', 0),
(3820, 0, 'config', 'config_affiliate_id', '4', 0),
(3819, 0, 'config', 'config_stock_status_id', '5', 0),
(3818, 0, 'config', 'config_stock_checkout', '0', 0),
(3817, 0, 'config', 'config_stock_warning', '0', 0),
(3816, 0, 'config', 'config_stock_display', '0', 0),
(3815, 0, 'config', 'config_complete_status_id', '5', 0),
(3814, 0, 'config', 'config_order_status_id', '1', 0),
(3813, 0, 'config', 'config_invoice_prefix', 'INV-2012-00', 0),
(3812, 0, 'config', 'config_order_edit', '100', 0),
(3811, 0, 'config', 'config_checkout_id', '5', 0),
(3810, 0, 'config', 'config_guest_checkout', '1', 0),
(3809, 0, 'config', 'config_cart_weight', '0', 0),
(3808, 0, 'config', 'config_account_id', '3', 0),
(3806, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(3807, 0, 'config', 'config_customer_price', '0', 0),
(3805, 0, 'config', 'config_customer_group_id', '1', 0),
(3804, 0, 'config', 'config_tax_customer', 'shipping', 0),
(3803, 0, 'config', 'config_tax_default', 'shipping', 0),
(3802, 0, 'config', 'config_vat', '0', 0),
(3801, 0, 'config', 'config_tax', '0', 0),
(3800, 0, 'config', 'config_voucher_max', '1000', 0),
(3799, 0, 'config', 'config_voucher_min', '1', 0),
(3798, 0, 'config', 'config_upload_allowed', 'jpg, JPG, jpeg, gif, png, txt', 0),
(3797, 0, 'config', 'config_download', '0', 0),
(3796, 0, 'config', 'config_review_status', '0', 0),
(3795, 0, 'config', 'config_product_count', '0', 0),
(3794, 0, 'config', 'config_admin_limit', '20', 0),
(3793, 0, 'config', 'config_catalog_limit', '6', 0),
(3792, 0, 'config', 'config_weight_class_id', '1', 0),
(3791, 0, 'config', 'config_length_class_id', '1', 0),
(3788, 0, 'config', 'config_admin_language', 'ru', 0),
(3789, 0, 'config', 'config_currency', 'RUB', 0),
(3790, 0, 'config', 'config_currency_auto', '1', 0),
(3787, 0, 'config', 'config_language', 'ru', 0),
(3786, 0, 'config', 'config_zone_id', '2761', 0),
(3785, 0, 'config', 'config_country_id', '176', 0),
(3784, 0, 'config', 'config_layout_id', '4', 0),
(3780, 0, 'config', 'config_map', '', 0),
(3781, 0, 'config', 'config_title', 'Top Raise - специализированный магазин сантехники', 0),
(3782, 0, 'config', 'config_meta_description', '', 0),
(3783, 0, 'config', 'config_template', 'topraise', 0),
(3778, 0, 'config', 'config_telephone', '(3822) 65-65-82', 0),
(3779, 0, 'config', 'config_fax', '', 0),
(3777, 0, 'config', 'config_email', 'ooosefi@mail.ru', 0),
(3776, 0, 'config', 'config_times', 'работает с 09:00 до 18:00 часов\r\nв субботу с 10:00 до 17:00 часов\r\nв воскресенье с 10:00 до 14:00 часов', 0),
(3775, 0, 'config', 'config_address', 'Россия, г. Томск, Иркутский проезд, 1', 0),
(3774, 0, 'config', 'config_owner', 'Мое Имя', 0),
(3773, 0, 'config', 'config_name', 'Top Raise - специализированный магазин сантехники', 0),
(3772, 0, 'welcome', 'welcome_module', 'a:1:{i:1;a:5:{s:11:"description";a:1:{i:1;s:1287:"&lt;p&gt;\r\n	У нас вы найдете самый большой выбор &lt;a href=&quot;/index.php?route=product/category&amp;amp;path=69&quot;&gt;смесителей&lt;/a&gt;, &lt;a href=&quot;/index.php?route=product/category&amp;amp;path=75&quot;&gt;аксессуаров&lt;/a&gt; и &lt;a href=&quot;/index.php?route=product/category&amp;amp;path=74&quot;&gt;мебели для ванных комнат&lt;/a&gt;, &lt;a href=&quot;/index.php?route=product/category&amp;amp;path=74_79&quot;&gt;стеклянных раковин&lt;/a&gt;, &lt;a href=&quot;&quot;&gt;кухонных моек&lt;/a&gt;, &lt;a href=&quot;/index.php?route=product/category&amp;amp;path=74_78&quot;&gt;зеркал&lt;/a&gt; и &lt;a href=&quot;/index.php?route=product/category&amp;amp;path=59&quot;&gt;душевых кабин&lt;/a&gt;. На ваш выбор представлена эксклюзивная продукция на российском рынке сантехники — стеклянная мебель для ванных комнат, &lt;a href=&quot;/index.php?route=product/category&amp;amp;path=74_78&quot;&gt;зеркала&lt;/a&gt; и &lt;a href=&quot;/index.php?route=product/category&amp;amp;path=74_79&quot;&gt;раковины&lt;/a&gt;.&lt;/p&gt;\r\n";}s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(3870, 0, 'config', 'config_maintenance', '0', 0),
(3871, 0, 'config', 'config_encryption', 'dfbec5b4a36a9c39ddbe3cd1078e7929', 0),
(3872, 0, 'config', 'config_compression', '0', 0),
(3873, 0, 'config', 'config_error_display', '1', 0),
(3874, 0, 'config', 'config_error_log', '1', 0),
(3875, 0, 'config', 'config_error_filename', 'error.txt', 0),
(3876, 0, 'config', 'config_google_analytics', '', 0),
(3877, 0, 'config', 'config_footer_js', '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!-- /* build:::5 */ --&gt;\r\nvar liveTex = true,\r\n        liveTexID = 36657,\r\n        liveTex_object = true;\r\n(function() {\r\n    var lt = document.createElement(''script'');\r\n    lt.type =''text/javascript'';\r\n    lt.async = true;\r\n    lt.src = ''http://cs15.livetex.ru/js/client.js'';\r\n    var sc = document.getElementsByTagName(''script'')[0];\r\n    sc.parentNode.insertBefore(lt, sc);\r\n})();\r\n&lt;/script&gt;\r\n', 0);
