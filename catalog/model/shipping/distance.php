<?php
class ModelShippingDistance extends Model {
    function getQuote($address) {
        $this->load->language('shipping/distance');

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('distance_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

        if (!$this->config->get('distance_geo_zone_id')) {
            $status = true;
        } elseif ($query->num_rows) {
            $status = true;
        } else {
            $status = false;
        }

        $method_data = array();

        if ($status) {
            $cost = 0;
            $costKm = 0;
            $weight = $this->cart->getWeight();

            $rates = explode(',', $this->config->get('distance_rate'));

            $quote_data = array();

            foreach ($rates as $rate) {
                $data = explode(':', $rate);

                $km = $data[0];
                $costKm = $data[1];

                $quote_data['distance_' . $km] = array(
                    'code'         => 'distance.distance_' . $km,
                    'title'        => 'в пределах ' .$km. ' км от города',//$this->language->get('text_title') . '  (' . $this->language->get('text_weight') . ' ' . $this->weight->format($weight, $this->config->get('config_weight_class_id')) . ')',
                    'cost'         => $costKm,
                    'tax_class_id' => $this->config->get('distance_tax_class_id'),
                    'text'         => $this->currency->format($this->tax->calculate($costKm, $this->config->get('distance_tax_class_id'), $this->config->get('config_tax')))
                );

                /*if ($data[0] >= $weight) {
                    if (isset($data[1])) {
                        $cost = $data[1];
                    }

                    break;
                }*/
            }



            //if ((float)$cost) {
                /*$quote_data['distance'] = array(
                    'code'         => 'distance.distance',
                    'title'        => $this->language->get('text_title') . '  (' . $this->language->get('text_weight') . ' ' . $this->weight->format($weight, $this->config->get('config_weight_class_id')) . ')',
                    'cost'         => $cost,
                    'tax_class_id' => $this->config->get('distance_tax_class_id'),
                    'text'         => $this->currency->format($this->tax->calculate($cost, $this->config->get('distance_tax_class_id'), $this->config->get('config_tax')))
                );*/

                $method_data = array(
                    'code'       => 'distance',
                    'title'      => $this->language->get('text_title'),
                    'quote'      => $quote_data,
                    'sort_order' => $this->config->get('distance_sort_order'),
                    'error'      => false
                );
            //}
        }

        return $method_data;
    }
}
?>