-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 09 2012 г., 18:32
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3558 ;

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
(3557, 0, 'config', 'config_google_analytics', '', 0),
(1131, 0, 'distance', 'distance_status', '1', 0),
(3556, 0, 'config', 'config_error_filename', 'error.txt', 0),
(56, 0, 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(3555, 0, 'config', 'config_error_log', '1', 0),
(60, 0, 'account', 'account_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(3554, 0, 'config', 'config_error_display', '1', 0),
(3553, 0, 'config', 'config_compression', '0', 0),
(3552, 0, 'config', 'config_encryption', 'dfbec5b4a36a9c39ddbe3cd1078e7929', 0),
(3551, 0, 'config', 'config_maintenance', '0', 0),
(3550, 0, 'config', 'config_seo_url_postfix', '', 0),
(3549, 0, 'config', 'config_seo_url_include_path', '0', 0),
(3548, 0, 'config', 'config_seo_url_type', 'seo_url', 0),
(3547, 0, 'config', 'config_seo_url', '0', 0),
(3546, 0, 'config', 'config_use_ssl', '0', 0),
(3545, 0, 'config', 'config_sms_gate_password', '', 0),
(3544, 0, 'config', 'config_sms_gate_username', '', 0),
(3543, 0, 'config', 'config_sms_message', '', 0),
(3542, 0, 'config', 'config_sms_copy', '', 0),
(3541, 0, 'config', 'config_sms_to', '', 0),
(3540, 0, 'config', 'config_sms_from', '', 0),
(1130, 0, 'distance', 'distance_geo_zone_id', '0', 0),
(3539, 0, 'config', 'config_sms_gatename', 'testsms', 0),
(3538, 0, 'config', 'config_sms_alert', '0', 0),
(3537, 0, 'config', 'config_fraud_status_id', '14', 0),
(3536, 0, 'config', 'config_fraud_score', '', 0),
(3535, 0, 'config', 'config_fraud_key', '', 0),
(1081, 0, 'free_checkout', 'free_checkout_sort_order', '', 0),
(3534, 0, 'config', 'config_fraud_detection', '0', 0),
(3533, 0, 'config', 'config_alert_emails', '', 0),
(3532, 0, 'config', 'config_account_mail', '0', 0),
(3531, 0, 'config', 'config_alert_mail', '1', 0),
(3530, 0, 'config', 'config_smtp_timeout', '5', 0),
(855, 0, 'bestseller', 'bestseller_module', 'a:1:{i:0;a:7:{s:5:"limit";s:2:"20";s:11:"image_width";s:3:"130";s:12:"image_height";s:3:"230";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(854, 0, 'latest', 'latest_module', 'a:1:{i:0;a:7:{s:5:"limit";s:2:"20";s:11:"image_width";s:3:"175";s:12:"image_height";s:3:"180";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(3529, 0, 'config', 'config_smtp_port', '25', 0),
(3528, 0, 'config', 'config_smtp_password', '', 0),
(3527, 0, 'config', 'config_smtp_username', '', 0),
(3524, 0, 'config', 'config_mail_protocol', 'mail', 0),
(3526, 0, 'config', 'config_smtp_host', '', 0),
(3525, 0, 'config', 'config_mail_parameter', '', 0),
(3523, 0, 'config', 'config_image_cart_height', '100', 0),
(3522, 0, 'config', 'config_image_cart_width', '59', 0),
(3521, 0, 'config', 'config_image_wishlist_height', '47', 0),
(3520, 0, 'config', 'config_image_wishlist_width', '47', 0),
(3518, 0, 'config', 'config_image_compare_width', '59', 0),
(3519, 0, 'config', 'config_image_compare_height', '100', 0),
(3517, 0, 'config', 'config_image_related_height', '100', 0),
(3516, 0, 'config', 'config_image_related_width', '59', 0),
(3515, 0, 'config', 'config_image_additional_height', '74', 0),
(3514, 0, 'config', 'config_image_additional_width', '74', 0),
(3513, 0, 'config', 'config_image_product_height', '230', 0),
(3512, 0, 'config', 'config_image_product_width', '130', 0),
(3511, 0, 'config', 'config_image_popup_height', '500', 0),
(3506, 0, 'config', 'config_image_category_width', '80', 0),
(3507, 0, 'config', 'config_image_category_height', '80', 0),
(3508, 0, 'config', 'config_image_thumb_width', '120', 0),
(3509, 0, 'config', 'config_image_thumb_height', '230', 0),
(3510, 0, 'config', 'config_image_popup_width', '500', 0),
(3505, 0, 'config', 'config_icon', '', 0),
(3504, 0, 'config', 'config_logo', 'data/logo.png', 0),
(3503, 0, 'config', 'config_return_status_id', '2', 0),
(3502, 0, 'config', 'config_commission', '5', 0),
(3501, 0, 'config', 'config_affiliate_id', '4', 0),
(3500, 0, 'config', 'config_stock_status_id', '5', 0),
(3499, 0, 'config', 'config_stock_checkout', '0', 0),
(3498, 0, 'config', 'config_stock_warning', '0', 0),
(3497, 0, 'config', 'config_stock_display', '0', 0),
(3496, 0, 'config', 'config_complete_status_id', '5', 0),
(3495, 0, 'config', 'config_order_status_id', '1', 0),
(3494, 0, 'config', 'config_invoice_prefix', 'INV-2012-00', 0),
(3493, 0, 'config', 'config_order_edit', '100', 0),
(3492, 0, 'config', 'config_checkout_id', '5', 0),
(3491, 0, 'config', 'config_guest_checkout', '1', 0),
(3488, 0, 'config', 'config_customer_price', '0', 0),
(3489, 0, 'config', 'config_account_id', '3', 0),
(3486, 0, 'config', 'config_customer_group_id', '1', 0),
(3487, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(1129, 0, 'distance', 'distance_tax_class_id', '0', 0),
(1122, 0, 'pickup', 'pickup_sort_order', '0', 0),
(1120, 0, 'pickup', 'pickup_geo_zone_id', '0', 0),
(2602, 0, 'menu', 'menu_module', 'a:6:{i:0;a:4:{s:9:"layout_id";s:1:"8";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:1;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:2;a:4:{s:9:"layout_id";s:1:"4";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:3;a:4:{s:9:"layout_id";s:2:"11";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:4;a:4:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:5;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(2813, 0, 'remont', 'remont_thumb_width', '310', 0),
(2814, 0, 'remont', 'remont_thumb_height', '201', 0),
(2815, 0, 'remont', 'remont_popup_width', '310', 0),
(2816, 0, 'remont', 'remont_popup_height', '201', 0),
(2817, 0, 'remont', 'remont_headline_module', '0', 0),
(3490, 0, 'config', 'config_cart_weight', '0', 0),
(3485, 0, 'config', 'config_tax_customer', 'shipping', 0),
(3484, 0, 'config', 'config_tax_default', 'shipping', 0),
(3483, 0, 'config', 'config_vat', '0', 0),
(3481, 0, 'config', 'config_voucher_max', '1000', 0),
(3482, 0, 'config', 'config_tax', '0', 0),
(3480, 0, 'config', 'config_voucher_min', '1', 0),
(3478, 0, 'config', 'config_download', '0', 0),
(3479, 0, 'config', 'config_upload_allowed', 'jpg, JPG, jpeg, gif, png, txt', 0),
(3477, 0, 'config', 'config_review_status', '0', 0),
(3476, 0, 'config', 'config_product_count', '0', 0),
(3475, 0, 'config', 'config_admin_limit', '20', 0),
(3474, 0, 'config', 'config_catalog_limit', '6', 0),
(3473, 0, 'config', 'config_weight_class_id', '1', 0),
(3472, 0, 'config', 'config_length_class_id', '1', 0),
(3471, 0, 'config', 'config_currency_auto', '1', 0),
(3470, 0, 'config', 'config_currency', 'RUB', 0),
(3469, 0, 'config', 'config_admin_language', 'ru', 0),
(3468, 0, 'config', 'config_language', 'ru', 0),
(3467, 0, 'config', 'config_zone_id', '2761', 0),
(3466, 0, 'config', 'config_country_id', '176', 0),
(3465, 0, 'config', 'config_layout_id', '4', 0),
(3464, 0, 'config', 'config_template', 'topraise', 0),
(3462, 0, 'config', 'config_title', 'Top Raise - специализированный магазин сантехники', 0),
(3463, 0, 'config', 'config_meta_description', '', 0),
(3461, 0, 'config', 'config_map', '', 0),
(3458, 0, 'config', 'config_email', 'ooosefi@mail.ru', 0),
(3460, 0, 'config', 'config_fax', '', 0),
(3459, 0, 'config', 'config_telephone', '(3822) 65-65-82', 0),
(3456, 0, 'config', 'config_address', 'Россия, г. Томск, Иркутский проезд, 1', 0),
(3457, 0, 'config', 'config_times', 'работает с 09:00 до 18:00 часов\r\nв субботу с 10:00 до 17:00 часов\r\nв воскресенье с 10:00 до 14:00 часов', 0),
(3454, 0, 'config', 'config_name', 'Top Raise - специализированный магазин сантехники', 0),
(3455, 0, 'config', 'config_owner', 'Мое Имя', 0);
