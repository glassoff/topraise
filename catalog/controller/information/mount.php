<?php
class ControllerInformationMount extends Controller {
    public function index() {
        $this->load->language('information/mount');
        $this->load->model('fido/remont');

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'href'      => $this->url->link('common/home'),
            'text'      => $this->language->get('text_home'),
            'separator' => FALSE
        );

        if (isset($this->request->get['remont_id'])) {
            $remont_id = $this->request->get['remont_id'];
        } else {
            $remont_id = 0;
        }

        $remont_info = $this->model_fido_remont->getRemontStory($remont_id);

        if ($remont_info) {
            $this->document->setTitle($remont_info['title']);

            $this->data['breadcrumbs'][] = array(
                'href'      => $this->url->link('information/remont'),
                'text'      => $this->language->get('heading_title'),
                'separator' => $this->language->get('text_separator')
            );

            $this->data['breadcrumbs'][] = array(
                'href'      => $this->url->link('information/remont', 'remont_id=' . $this->request->get['remont_id']),
                'text'      => $remont_info['title'],
                'separator' => $this->language->get('text_separator')
            );

            $this->data['remont_info'] = $remont_info;

            $this->data['heading_title'] = $remont_info['title'];

            $this->document->setDescription($remont_info['meta_description']);

            $this->data['description'] = html_entity_decode($remont_info['description']);

            $this->data['video_code'] = $remont_info['video_code'];

            $this->load->model('tool/image');

            if ($remont_info['image']) {
                $this->data['image'] = TRUE;
            } else {
                $this->data['image'] = FALSE;
            }

            $this->data['images'] = array();

            $results = $this->model_fido_remont->getRemontImages($remont_id);

            $this->document->addScript('catalog/view/theme/topraise/js/jquery.carouFredSel-6.1.0-packed.js');

            $this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
            $this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');


            foreach ($results as $result) {
                $this->data['images'][] = array(
                    'popup' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
                    'thumb' => $this->model_tool_image->cropsize($result['image'], 174, 110),
                    'description' => $result['description'],
                );
            }

            $this->data['date_added'] = date($this->language->get('date_format_short'), strtotime($remont_info['date_added']));

            $this->data['min_height'] = $this->config->get('remont_thumb_height');

            $this->data['thumb'] = $this->model_tool_image->resize($remont_info['image'], $this->config->get('remont_thumb_width'), $this->config->get('remont_thumb_height'));
            $this->data['popup'] = $this->model_tool_image->resize($remont_info['image'], $this->config->get('remont_popup_width'), $this->config->get('remont_popup_height'));

            $this->data['button_remont'] = $this->language->get('button_remont');

            $this->data['remont'] = $this->url->link('information/services', 'type=' . $remont_info['type']);

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/mount.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/information/mount.tpl';
            } else {
                $this->template = 'default/template/information/mount.tpl';
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
        } else {
            $this->document->setTitle($this->language->get('text_error'));

            $this->document->breadcrumbs[] = array(
                'href'      => $this->url->link('information/remont'),
                'text'      => $this->language->get('text_error'),
                'separator' => $this->language->get('text_separator')
            );

            $this->data['heading_title'] = $this->language->get('text_error');

            $this->data['text_error'] = $this->language->get('text_error');

            $this->data['button_continue'] = $this->language->get('button_continue');

            $this->data['continue'] = $this->url->link('common/home');

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
            } else {
                $this->template = 'default/template/error/not_found.tpl';
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
}
?>
