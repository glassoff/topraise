<?php
class ControllerPaymentCardTransfer extends Controller {
    protected function index($args) {

        $method = $args['method'];
        $parts = explode('_', $method);
        $id = array_pop($parts);

        $this->data['id'] = $id;

        $this->language->load('payment/card_transfer');

        $this->data['text_instruction'] = $this->language->get('text_instruction');
        $this->data['text_description'] = $this->language->get('text_description');
        $this->data['text_payment'] = $this->language->get('text_payment');

        $this->data['button_confirm'] = $this->language->get('button_confirm');


        $payments = $this->config->get('card_payment');//print_r($payments);die();
        $payment = $payments[$id];

        $this->data['bank'] = $payment['card_transfer_bank_' . $this->config->get('config_language_id')];

        //$this->data['bank'] = nl2br($this->config->get('card_transfer_bank_' . $this->config->get('config_language_id')));

        $this->data['continue'] = $this->url->link('checkout/success');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/card_transfer.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/payment/card_transfer.tpl';
        } else {
            $this->template = 'default/template/payment/card_transfer.tpl';
        }

        $this->render();
    }

    public function confirm() {
        $this->language->load('payment/card_transfer');

        $this->load->model('checkout/order');

        $id = $this->request->get['id'];

        $payments = $this->config->get('card_payment');
        $payment = $payments[$id];

        $comment  = $this->language->get('text_instruction') . "\n\n";
        //$comment .= $this->config->get('card_transfer_bank_' . $this->config->get('config_language_id')) . "\n\n";

        $comment .= $payment['card_transfer_bank_' . $this->config->get('config_language_id')] . "\n\n";

        $comment .= $this->language->get('text_payment');

        $this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('card_transfer_order_status_id'), $comment, true);
    }
}
?>