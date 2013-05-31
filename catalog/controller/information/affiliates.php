<?php
class ControllerInformationAffiliates extends Controller {
    public function index() {

        $this->data['heading_title'] = 'Наши представительства';

        $this->document->setTitle($this->data['heading_title']);
        $this->document->setDescription('');
        $this->document->setKeywords('');

        $this->document->addScript('http://api-maps.yandex.ru/2.0-stable/?load=package.standard&lang=ru-RU');

        $this->data['affiliates'] = $this->config->get('affiliates_module');

        $sort_order = array();
        foreach($this->data['affiliates'] as $key => $value){
            $sort_order[$key] = $value['sort_order'];
        }
        array_multisort($sort_order, SORT_ASC, $this->data['affiliates']);


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/affiliates.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/information/affiliates.tpl';
        } else {
            $this->template = 'default/template/information/affiliates.tpl';
        }

        $this->children = array(
            'common/column_left',
            'common/column_right',
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }
}
