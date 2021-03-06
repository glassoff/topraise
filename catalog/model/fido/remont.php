<?php
class ModelFidoRemont extends Model {
    public function getRemontStory($remont_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "remont n LEFT JOIN " . DB_PREFIX . "remont_description nd ON (n.remont_id = nd.remont_id) LEFT JOIN " . DB_PREFIX . "remont_to_store n2s ON (n.remont_id = n2s.remont_id) WHERE n.remont_id = '" . (int)$remont_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1'");
        return $query->row;
    }

    public function getRemont($type = 'equipment', $start = 0, $limit = 0) {
        $sql = "SELECT * FROM " . DB_PREFIX . "remont n LEFT JOIN " . DB_PREFIX . "remont_description nd ON (n.remont_id = nd.remont_id) LEFT JOIN " . DB_PREFIX . "remont_to_store n2s ON (n.remont_id = n2s.remont_id) WHERE n.type = '{$type}' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1' ORDER BY n.date_added DESC";
        $sql .= " LIMIT {$start}, {$limit}";
        $query = $this->db->query($sql);
        return $query->rows;
    }

    public function getRemontShorts($limit) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "remont n LEFT JOIN " . DB_PREFIX . "remont_description nd ON (n.remont_id = nd.remont_id) LEFT JOIN " . DB_PREFIX . "remont_to_store n2s ON (n.remont_id = n2s.remont_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1' ORDER BY n.date_added DESC LIMIT " . (int)$limit);
        return $query->rows;
    }

    public function getTotalRemont($type = 'equipment') {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "remont n LEFT JOIN " . DB_PREFIX . "remont_to_store n2s ON (n.remont_id = n2s.remont_id) WHERE n.type = '{$type}' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1'");
        if ($query->row) {
            return $query->row['total'];
        } else {
            return FALSE;
        }
    }

    public function getRemontImages($remont_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "remont_image WHERE remont_id = '" . (int)$remont_id . "' ORDER BY sort_order ASC");

        return $query->rows;
    }
}
?>
