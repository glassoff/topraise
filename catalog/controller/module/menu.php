<?php

class ControllerModuleMenu extends Controller {
	protected function index($setting) {

        $this->data['menu'] = array(
            'Услуги' => array(
                array('title' => 'Монтаж оборудования', 'route' => 'information/services', 'params' => 'type=equipment'),
                array('title' => 'Монтаж водоснабжения', 'route' => 'information/services', 'params' => 'type=water'),
            ),
            'Компания' => array(
                array('title' => 'О нас', 'route' => 'information/information', 'params' => 'information_id=4'),
                array('title' => 'Новости', 'route' => 'information/news', 'params' => ''),
                array('title' => 'Доставка и покупка', 'route' => 'information/buy-shipping', 'params' => ''),
                array('title' => 'Контакты', 'route' => 'information/contact', 'params' => ''),
                array('title' => 'Оптовикам', 'route' => 'information/opt', 'params' => ''),
                array('title' => 'Наши представительства', 'route' => 'information/affiliates', 'params' => ''),
            ),
        );

        foreach($this->data['menu'] as & $menuGroup){
            foreach($menuGroup as & $menuItem){
                $menuItem['href'] = $this->url->link($menuItem['route'], $menuItem['params']);
                $menuItem['active'] = $this->isCurrentUrl($menuItem['route'], $menuItem['params']);
            }
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/menu.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/menu.tpl';
        } else {
            $this->template = 'default/template/module/menu.tpl';
        }

        $this->render();
    }

    protected function isCurrentUrl($route, $params)
    {
        $currentRoute = $this->request->get['route'];
        if($currentRoute == $route){
            if(!$params){
                return true;
            }
            else{
                parse_str($params, $parts);

                foreach ($parts as $k => $v) {
                    if(isset($this->request->get[$k]) && $this->request->get[$k] == $v){
                        unset($parts[$k]);
                    }
                }

                if(!$parts){
                    return true;
                }
            }
        }
        return false;
    }
}