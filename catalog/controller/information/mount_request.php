<?php
class ControllerInformationMountRequest extends Controller {
    private $error = array();

    public function index() {
        $this->language->load('information/mount_request');

        $this->document->setTitle($this->language->get('heading_title'));

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->hostname = $this->config->get('config_smtp_host');
            $mail->username = $this->config->get('config_smtp_username');
            $mail->password = $this->config->get('config_smtp_password');
            $mail->port = $this->config->get('config_smtp_port');
            $mail->timeout = $this->config->get('config_smtp_timeout');
            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($this->request->post['name']);
            $mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));

            $emailText = html_entity_decode(
                sprintf(
                    $this->language->get('email_body'),
                    $this->request->post['address'],
                    $this->request->post['howdo'],
                    $this->request->post['date'],
                    $this->request->post['comment']
                ),
                ENT_QUOTES, 'UTF-8');

            $mail->setText(strip_tags(html_entity_decode($emailText, ENT_QUOTES, 'UTF-8')));
            $mail->send();

            $this->redirect($this->url->link('information/mount_request/success'));
        }

        /*$this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('information/opt'),
            'separator' => $this->language->get('text_separator')
        );*/

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['entry_name'] = $this->language->get('entry_name');
        $this->data['entry_address'] = $this->language->get('entry_address');
        $this->data['entry_howdo'] = $this->language->get('entry_howdo');
        $this->data['entry_date'] = $this->language->get('entry_date');
        $this->data['entry_comment'] = $this->language->get('entry_comment');
        $this->data['entry_captcha'] = $this->language->get('entry_captcha');

        if (isset($this->error['name'])) {
            $this->data['error_name'] = $this->error['name'];
        } else {
            $this->data['error_name'] = '';
        }

        if (isset($this->error['address'])) {
            $this->data['error_address'] = $this->error['address'];
        } else {
            $this->data['error_address'] = '';
        }

        if (isset($this->error['howdo'])) {
            $this->data['error_howdo'] = $this->error['howdo'];
        } else {
            $this->data['error_howdo'] = '';
        }

        if (isset($this->error['date'])) {
            $this->data['error_date'] = $this->error['date'];
        } else {
            $this->data['error_date'] = '';
        }

        if (isset($this->error['captcha'])) {
            $this->data['error_captcha'] = $this->error['captcha'];
        } else {
            $this->data['error_captcha'] = '';
        }

        $this->data['button_continue'] = $this->language->get('button_continue');

        $this->data['action'] = '';

        if (isset($this->request->post['name'])) {
            $this->data['name'] = $this->request->post['name'];
        } else {
            $this->data['name'] = $this->customer->getFirstName();
        }

        if (isset($this->request->post['address'])) {
            $this->data['address'] = $this->request->post['address'];
        } else {
            $this->data['address'] = '';
        }

        if (isset($this->request->post['howdo'])) {
            $this->data['howdo'] = $this->request->post['howdo'];
        } else {
            $this->data['howdo'] = '';
        }

        if (isset($this->request->post['date'])) {
            $this->data['date'] = $this->request->post['date'];
        } else {
            $this->data['date'] = '';
        }

        if (isset($this->request->post['comment'])) {
            $this->data['comment'] = $this->request->post['comment'];
        } else {
            $this->data['comment'] = '';
        }

        if (isset($this->request->post['captcha'])) {
            $this->data['captcha'] = $this->request->post['captcha'];
        } else {
            $this->data['captcha'] = '';
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/mount_request.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/information/mount_request.tpl';
        } else {
            $this->template = 'default/template/information/mount_request.tpl';
        }

        /*$this->children = array(
            'common/column_left',
            'common/column_right',
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );*/

        //$this->response->setOutput($this->render());
        $this->render();
    }

    public function success() {
        $this->language->load('information/mount_request');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('information/opt'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_message'] = $this->language->get('text_message');

        $this->data['button_continue'] = $this->language->get('button_continue');

        $this->data['continue'] = $this->url->link('product/category');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/common/success.tpl';
        } else {
            $this->template = 'default/template/common/success.tpl';
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

    private function validate() {
        if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
            $this->error['name'] = $this->language->get('error_name');
        }

        if ((utf8_strlen($this->request->post['address']) < 10) || (utf8_strlen($this->request->post['address']) > 3000)) {
            $this->error['address'] = $this->language->get('error_address');
        }

        if ((utf8_strlen($this->request->post['howdo']) < 10) || (utf8_strlen($this->request->post['howdo']) > 3000)) {
            $this->error['howdo'] = $this->language->get('error_howdo');
        }

        if ((utf8_strlen($this->request->post['date']) < 1) || (utf8_strlen($this->request->post['date']) > 3000)) {
            $this->error['date'] = $this->language->get('error_date');
        }

        if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
            $this->error['captcha'] = $this->language->get('error_captcha');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function captcha() {
        $this->load->library('captcha');

        $captcha = new Captcha();

        $this->session->data['captcha'] = $captcha->getCode();

        $captcha->showImage();
    }
}
?>
