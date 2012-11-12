<?php

class ControllerModuleMenu extends Controller {
	protected function index($setting) {

        $this->data['menu'] = array(
            'Услуги' => array(
                'Монтаж оборудования' => '',
                'Монтаж водоснабжения' => '',
            ),
            'Компания' => array(
                'О нас' => $this->url->link('information/information', 'information_id=4'),
                'Новости' => $this->url->link('information/news'),
                'Доставка и покупка' => $this->url->link('information/buy-shipping'),
                'Контакты' => $this->url->link('information/contact'),
                'Оптовикам' => $this->url->link('information/opt'),
            ),
        );

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/menu.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/menu.tpl';
        } else {
            $this->template = 'default/template/module/menu.tpl';
        }

        $this->render();
    }

}