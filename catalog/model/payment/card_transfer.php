<?php
class ModelPaymentCardTransfer extends Model {
    public function getMethod($address, $total, & $count = 0) {
        $this->load->language('payment/card_transfer');

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('card_transfer_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

        if ($this->config->get('card_transfer_total') > $total) {
            $status = false;
        } elseif (!$this->config->get('card_transfer_geo_zone_id')) {
            $status = true;
        } elseif ($query->num_rows) {
            $status = true;
        } else {
            $status = false;
        }

        $method_data = array();

        if ($status) {
            $payments = $this->config->get('card_payment');//print_r($payments);die();

            $count = count($payments);

            $i = 0;
            foreach ($payments as $payment) {
                $i++;
                if(!$payment['card_transfer_status']){
                    continue;
                }
                $method_data[] = array(
                    'code'       => 'card_transfer',
                    'title'      => $this->language->get('text_title') . ' ' . $payment['card_transfer_name'],
                    'sort_order' => $this->config->get('card_transfer_sort_order') + $payment['card_transfer_sort_order'] / 10
                );
            }
        }

        return $method_data;
    }
}
?>