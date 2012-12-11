<?php
class ControllerModuleRemont extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('module/remont');
        $this->load->model('fido/remont');

        $this->model_fido_remont->checkRemont();

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            $this->model_setting_setting->editSetting('remont', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->getModule();
    }

    public function insert() {
        $this->load->language('module/remont');
        $this->load->model('fido/remont');

        $this->document->setTitle($this->language->get('heading_title'));

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) {
            $this->model_fido_remont->addRemont($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('module/remont/listing', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->getForm();
    }

    public function update() {
        $this->load->language('module/remont');
        $this->load->model('fido/remont');

        $this->document->setTitle($this->language->get('heading_title'));

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) {
            $this->model_fido_remont->editRemont($this->request->get['remont_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('module/remont/listing', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('module/remont');
        $this->load->model('fido/remont');

        $this->document->setTitle($this->language->get('heading_title'));

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $remont_id) {
                $this->model_fido_remont->deleteRemont($remont_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('module/remont/listing', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->getList();
    }

    public function listing() {
        $this->load->language('module/remont');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->getList();
    }

    private function getModule() {
        $this->load->language('module/remont');
        $this->load->model('fido/remont');

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');
        $this->data['text_content_top'] = $this->language->get('text_content_top');
        $this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
        $this->data['text_column_left'] = $this->language->get('text_column_left');
        $this->data['text_column_right'] = $this->language->get('text_column_right');

        $this->data['entry_limit'] = $this->language->get('entry_limit');
        $this->data['entry_layout'] = $this->language->get('entry_layout');
        $this->data['entry_position'] = $this->language->get('entry_position');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_headline'] = $this->language->get('entry_headline');
        $this->data['entry_numchars'] = $this->language->get('entry_numchars');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $this->data['entry_headline_chars'] = $this->language->get('entry_headline_chars');
        $this->data['entry_remontpage_thumb'] = $this->language->get('entry_remontpage_thumb');
        $this->data['entry_remontpage_popup'] = $this->language->get('entry_remontpage_popup');
        $this->data['entry_module_headline'] = $this->language->get('entry_module_headline');

        $this->data['button_remont'] = $this->language->get('button_remont');
        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_add_module'] = $this->language->get('button_add_module');
        $this->data['button_remove'] = $this->language->get('button_remove');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['numchars'])) {
            $this->data['error_numchars'] = $this->error['numchars'];
        } else {
            $this->data['error_numchars'] = '';
        }

        if (isset($this->error['remontpage_thumb'])) {
            $this->data['error_remontpage_thumb'] = $this->error['remontpage_thumb'];
        } else {
            $this->data['error_remontpage_thumb'] = '';
        }

        if (isset($this->error['remontpage_popup'])) {
            $this->data['error_remontpage_popup'] = $this->error['remontpage_popup'];
        } else {
            $this->data['error_remontpage_popup'] = '';
        }

        if (isset($this->error['module_chars'])) {
            $this->data['error_module_chars'] = $this->error['module_chars'];
        } else {
            $this->data['error_module_chars'] = array();
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'text'      => $this->language->get('text_home'),
            'separator' => FALSE
        );

        $this->data['breadcrumbs'][] = array(
            'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'text'      => $this->language->get('text_module'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'href'      => $this->url->link('module/remont', 'token=' . $this->session->data['token'], 'SSL'),
            'text'      => $this->language->get('heading_title'),
            'separator' => ' :: '
        );

        $this->data['remont'] = $this->url->link('module/remont/listing', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['action'] = $this->url->link('module/remont', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['remont_headline_chars'])) {
            $this->data['remont_headline_chars'] = $this->request->post['remont_headline_chars'];
        } else {
            $this->data['remont_headline_chars'] = $this->config->get('remont_headline_chars');
        }

        if (isset($this->request->post['remont_thumb_width'])) {
            $this->data['remont_thumb_width'] = $this->request->post['remont_thumb_width'];
        } else {
            $this->data['remont_thumb_width'] = $this->config->get('remont_thumb_width');
        }

        if (isset($this->request->post['remont_thumb_height'])) {
            $this->data['remont_thumb_height'] = $this->request->post['remont_thumb_height'];
        } else {
            $this->data['remont_thumb_height'] = $this->config->get('remont_thumb_height');
        }

        if (isset($this->request->post['remont_popup_width'])) {
            $this->data['remont_popup_width'] = $this->request->post['remont_popup_width'];
        } else {
            $this->data['remont_popup_width'] = $this->config->get('remont_popup_width');
        }

        if (isset($this->request->post['remont_popup_height'])) {
            $this->data['remont_popup_height'] = $this->request->post['remont_popup_height'];
        } else {
            $this->data['remont_popup_height'] = $this->config->get('remont_popup_height');
        }

        if (isset($this->request->post['remont_headline_module'])) {
            $this->data['remont_headline_module'] = $this->request->post['remont_headline_module'];
        } else {
            $this->data['remont_headline_module'] = $this->config->get('remont_headline_module');
        }

        $this->data['modules'] = array();

        if (isset($this->request->post['remont_module'])) {
            $this->data['modules'] = $this->request->post['remont_module'];
        } elseif ($this->config->get('remont_module')) {
            $this->data['modules'] = $this->config->get('remont_module');
        }

        $this->load->model('design/layout');

        $this->data['layouts'] = $this->model_design_layout->getLayouts();

        $this->template = 'module/remont.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    private function getList() {
        $this->load->language('module/remont');
        $this->load->model('fido/remont');

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_no_results'] = $this->language->get('text_no_results');

        $this->data['column_title'] = $this->language->get('column_title');
        $this->data['column_date_added'] = $this->language->get('column_date_added');
        $this->data['column_status'] = $this->language->get('column_status');
        $this->data['column_action'] = $this->language->get('column_action');

        $this->data['button_module'] = $this->language->get('button_module');
        $this->data['button_insert'] = $this->language->get('button_insert');
        $this->data['button_delete'] = $this->language->get('button_delete');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'text'      => $this->language->get('text_home'),
            'separator' => FALSE
        );

        $this->data['breadcrumbs'][] = array(
            'href'      => $this->url->link('module/remont/listing', 'token=' . $this->session->data['token'], 'SSL'),
            'text'      => $this->language->get('heading_title'),
            'separator' => ' :: '
        );

        $this->data['module'] = $this->url->link('module/remont', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['insert'] = $this->url->link('module/remont/insert', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['delete'] = $this->url->link('module/remont/delete', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['remont'] = array();

        $remont_total = $this->model_fido_remont->getTotalRemont();

        $results = $this->model_fido_remont->getRemont();

        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('text_edit'),
                'href' => $this->url->link('module/remont/update', 'token=' . $this->session->data['token'] . '&remont_id=' . $result['remont_id'], 'SSL')
            );

            $this->data['remont'][] = array(
                'remont_id'     => $result['remont_id'],
                'title'       => $result['title'],
                'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'status'      => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
                'selected'    => isset($this->request->post['selected']) && in_array($result['remont_id'], $this->request->post['selected']),
                'action'      => $action
            );
        }

        $this->template = 'module/remont/list.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    private function getForm() {
        $this->load->language('module/remont');
        $this->load->model('fido/remont');

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_default'] = $this->language->get('text_default');
        $this->data['text_image_manager'] = $this->language->get('text_image_manager');

        $this->data['entry_title'] = $this->language->get('entry_title');
        $this->data['entry_keyword'] = $this->language->get('entry_keyword');
        $this->data['entry_type'] = $this->language->get('entry_type');
        $this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
        $this->data['entry_description'] = $this->language->get('entry_description');
        $this->data['entry_store'] = $this->language->get('entry_store');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_image'] = $this->language->get('entry_image');

        $this->data['entry_images'] = $this->language->get('entry_images');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $this->data['button_add_image'] = $this->language->get('button_add_image');
        $this->data['text_browse'] = $this->language->get('text_browse');
        $this->data['text_clear'] = $this->language->get('text_clear');
        $this->data['button_remove'] = $this->language->get('button_remove');


        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        $this->data['tab_general'] = $this->language->get('tab_general');
        $this->data['tab_data'] = $this->language->get('tab_data');
        $this->data['tab_image'] = $this->language->get('tab_image');
        $this->data['tab_video'] = $this->language->get('tab_video');

        $this->data['entry_video_youtube'] = $this->language->get('entry_video_youtube');

        $this->data['token'] = $this->session->data['token'];

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['title'])) {
            $this->data['error_title'] = $this->error['title'];
        } else {
            $this->data['error_title'] = '';
        }

        if (isset($this->error['description'])) {
            $this->data['error_description'] = $this->error['description'];
        } else {
            $this->data['error_description'] = '';
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'text'      => $this->language->get('text_home'),
            'separator' => FALSE
        );

        $this->data['breadcrumbs'][] = array(
            'href'      => $this->url->link('module/remont/listing', 'token=' . $this->session->data['token'], 'SSL'),
            'text'      => $this->language->get('heading_title'),
            'separator' => ' :: '
        );

        if (!isset($this->request->get['remont_id'])) {
            $this->data['action'] = $this->url->link('module/remont/insert', 'token=' . $this->session->data['token'], 'SSL');
        } else {
            $this->data['action'] = $this->url->link('module/remont/update', 'token=' . $this->session->data['token'] . '&remont_id=' . $this->request->get['remont_id'], 'SSL');
        }

        $this->data['cancel'] = $this->url->link('module/remont/listing', 'token=' . $this->session->data['token'], 'SSL');

        if ((isset($this->request->get['remont_id'])) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $remont_info = $this->model_fido_remont->getRemontStory($this->request->get['remont_id']);
        }

        $this->load->model('localisation/language');

        $this->data['languages'] = $this->model_localisation_language->getLanguages();

        if (isset($this->request->post['remont_description'])) {
            $this->data['remont_description'] = $this->request->post['remont_description'];
        } elseif (isset($this->request->get['remont_id'])) {
            $this->data['remont_description'] = $this->model_fido_remont->getRemontDescriptions($this->request->get['remont_id']);
        } else {
            $this->data['remont_description'] = array();
        }

        $this->load->model('setting/store');

        $this->data['stores'] = $this->model_setting_store->getStores();

        if (isset($this->request->post['remont_store'])) {
            $this->data['remont_store'] = $this->request->post['remont_store'];
        } elseif (isset($remont_info)) {
            $this->data['remont_store'] = $this->model_fido_remont->getRemontStores($this->request->get['remont_id']);
        } else {
            $this->data['remont_store'] = array(0);
        }

        if (isset($this->request->post['keyword'])) {
            $this->data['keyword'] = $this->request->post['keyword'];
        } elseif (isset($remont_info)) {
            $this->data['keyword'] = $remont_info['keyword'];
        } else {
            $this->data['keyword'] = '';
        }

        if (isset($this->request->post['type'])) {
            $this->data['type'] = $this->request->post['type'];
        } elseif (isset($remont_info)) {
            $this->data['type'] = $remont_info['type'];
        } else {
            $this->data['type'] = '';
        }

        if (isset($this->request->post['status'])) {
            $this->data['status'] = $this->request->post['status'];
        } elseif (isset($remont_info)) {
            $this->data['status'] = $remont_info['status'];
        } else {
            $this->data['status'] = '';
        }

        if (isset($this->request->post['video_youtube'])) {
            $this->data['video_youtube'] = $this->request->post['video_youtube'];
        } elseif (isset($remont_info)) {
            $this->data['video_youtube'] = $remont_info['video_youtube'];
        } else {
            $this->data['video_youtube'] = '';
        }

        $this->load->model('tool/image');

        $this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

        if (isset($this->request->post['remont_image'])) {
            $remont_images = $this->request->post['remont_image'];
        } elseif (isset($this->request->get['remont_id'])) {
            $remont_images = $this->model_fido_remont->getRemontImages($this->request->get['remont_id']);
        } else {
            $remont_images = array();
        }

        $this->data['remont_images'] = array();

        foreach ($remont_images as $remont_image) {
            if ($remont_image['image'] && file_exists(DIR_IMAGE . $remont_image['image'])) {
                $image = $remont_image['image'];
            } else {
                $image = 'no_image.jpg';
            }

            $this->data['remont_images'][] = array(
                'image'      => $image,
                'thumb'      => $this->model_tool_image->resize($image, 100, 100),
                'sort_order' => $remont_image['sort_order'],
                'description' => $remont_image['description']
            );
        }

        if (isset($this->request->post['image'])) {
            $this->data['image'] = $this->request->post['image'];
        } elseif (isset($remont_info)) {
            $this->data['image'] = $remont_info['image'];
        } else {
            $this->data['image'] = '';
        }

        $this->load->model('tool/image');

        if (isset($remont_info) && $remont_info['image'] && file_exists(DIR_IMAGE . $remont_info['image'])) {
            $this->data['preview'] = $this->model_tool_image->resize($remont_info['image'], 100, 100);
        } else {
            $this->data['preview'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }

        $this->template = 'module/remont/form.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/remont')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['remont_headline_chars']) {
            $this->error['numchars'] = $this->language->get('error_numchars');
        }

        if (!$this->request->post['remont_thumb_width'] || !$this->request->post['remont_thumb_height']) {
            $this->error['remontpage_thumb'] = $this->language->get('error_remontpage_thumb');
        }

        if (!$this->request->post['remont_popup_width'] || !$this->request->post['remont_popup_height']) {
            $this->error['remontpage_popup'] = $this->language->get('error_remontpage_popup');
        }

        if (isset($this->request->post['remont_module'])) {
            foreach ($this->request->post['remont_module'] as $key => $value) {
                if (!$value['numchars']) {
                    $this->error['module_chars'][$key] = $this->language->get('error_numchars');
                }
            }
        }

        if (!$this->error) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    private function validateForm() {
        if (!$this->user->hasPermission('modify', 'module/remont')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        foreach ($this->request->post['remont_description'] as $language_id => $value) {
            if ((strlen($value['title']) < 3) || (strlen($value['title']) > 256)) {
                $this->error['title'][$language_id] = $this->language->get('error_title');
            }

            if (strlen($value['description']) < 3) {
                $this->error['description'][$language_id] = $this->language->get('error_description');
            }
        }

        if (!$this->error) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    private function validateDelete() {
        if (!$this->user->hasPermission('modify', 'module/remont')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
}
?>
