<?php
class ControllerInformationBuyShipping extends Controller {
    public function index() {

        $this->data['heading_title'] = 'Покупка и доставка';

        $this->document->setTitle($this->data['heading_title']);
        $this->document->setDescription('');
        $this->document->setKeywords('');

        $this->data['tab'] = isset($this->request->request['tab']) ? $this->request->request['tab'] : '';


        $this->document->addScript('catalog/view/javascript/jquery/tabs.js');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/buy-shipping.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/information/buy-shipping.tpl';
        } else {
            $this->template = 'default/template/information/buy-shipping.tpl';
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
