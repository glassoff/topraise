<?php
class ControllerShippingDistance extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('shipping/distance');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('distance', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_all_zones'] = $this->language->get('text_all_zones');
        $this->data['text_none'] = $this->language->get('text_none');

        $this->data['entry_rate'] = $this->language->get('entry_rate');
        $this->data['entry_tax_class'] = $this->language->get('entry_tax_class');
        $this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_shipping'),
            'href'      => $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('shipping/distance', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('shipping/distance', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['cancel'] = $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['distance_rate'])) {
            $this->data['distance_rate'] = $this->request->post['distance_rate'];
        } elseif ($this->config->get('distance_rate')) {
            $this->data['distance_rate'] = $this->config->get('distance_rate');
        } else {
            $this->data['distance_rate'] = '10:11.6,15:14.1,20:16.60,25:19.1,30:21.6,35:24.1,40:26.6,45:29.1,50:31.6,55:34.1,60:36.6,65:39.1,70:41.6,75:44.1,80:46.6,100:56.6,125:69.1,150:81.6,200:106.6';
        }

        if (isset($this->request->post['distance_tax_class_id'])) {
            $this->data['distance_tax_class_id'] = $this->request->post['distance_tax_class_id'];
        } else {
            $this->data['distance_tax_class_id'] = $this->config->get('distance_tax_class_id');
        }

        if (isset($this->request->post['distance_geo_zone_id'])) {
            $this->data['distance_geo_zone_id'] = $this->request->post['distance_geo_zone_id'];
        } else {
            $this->data['distance_geo_zone_id'] = $this->config->get('distance_geo_zone_id');
        }

        if (isset($this->request->post['distance_status'])) {
            $this->data['distance_status'] = $this->request->post['distance_status'];
        } else {
            $this->data['distance_status'] = $this->config->get('distance_status');
        }

        if (isset($this->request->post['distance_sort_order'])) {
            $this->data['distance_sort_order'] = $this->request->post['distance_sort_order'];
        } else {
            $this->data['distance_sort_order'] = $this->config->get('distance_sort_order');
        }

        $this->load->model('localisation/tax_class');

        $this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

        $this->load->model('localisation/geo_zone');

        $this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

        $this->template = 'shipping/distance.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'shipping/distance')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}
?>