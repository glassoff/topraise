<?php
class ModelFidoRemont extends Model {
    public function addRemont($data) {
        //set remont main image
        if(isset($data['remont_image'])){
            $images = $data['remont_image'];
            $orders = array();
            foreach($images as $image){
                $orders[] = $image['sort_order'];
            }
            array_multisort($images, SORT_ASC, $orders);
            $data['image'] = $images[0]['image'];
        }

        if($data['video_youtube']){
            $video_code = $this->getVideoCode($data['video_youtube']);
            $data['image'] = $this->loadVideoThumb($data['video_youtube']);
        }
        else{
            $video_code = '';
        }

        $this->db->query("INSERT INTO " . DB_PREFIX . "remont SET status = '" . (int)$data['status'] . "', date_added = now(), type = '{$data['type']}', video_youtube = '{$data['video_youtube']}', video_code = '{$video_code}'");
        $remont_id = $this->db->getLastId();
        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "remont SET image = '" . $this->db->escape($data['image']) . "' WHERE remont_id = '" . (int)$remont_id . "'");
        }
        foreach ($data['remont_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "remont_description SET remont_id = '" . (int)$remont_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
        }
        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'remont_id=" . (int)$remont_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }
        if (isset($data['remont_store'])) {
            foreach ($data['remont_store'] as $store_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "remont_to_store SET remont_id = '" . (int)$remont_id . "', store_id = '" . (int)$store_id . "'");
            }
        }

        if (isset($data['remont_image'])) {
            foreach ($data['remont_image'] as $remont_image) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "remont_image SET remont_id = '" . (int)$remont_id . "', image = '" . $this->db->escape(html_entity_decode($remont_image['image'], ENT_QUOTES, 'UTF-8')) . "', description = '{$remont_image['description']}', sort_order = '" . (int)$remont_image['sort_order'] . "'");
            }
        }

        $this->cache->delete('remont');
    }

    public function editRemont($remont_id, $data) {
        //set remont main image
        if(isset($data['remont_image'])){
            $images = $data['remont_image'];
            $orders = array();
            foreach($images as $image){
                $orders[] = $image['sort_order'];
            }
            array_multisort($images, SORT_ASC, $orders);
            $data['image'] = $images[0]['image'];
        }

        if($data['video_youtube']){
            $video_code = $this->getVideoCode($data['video_youtube']);
            $data['image'] = $this->loadVideoThumb($data['video_youtube']);
        }
        else{
            $video_code = '';
        }

        $this->db->query("UPDATE " . DB_PREFIX . "remont SET status = '" . (int)$data['status'] . "', type = '{$data['type']}', video_youtube = '{$data['video_youtube']}', video_code = '{$video_code}' WHERE remont_id = '" . (int)$remont_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "remont_description WHERE remont_id = '" . (int)$remont_id . "'");
        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "remont SET image = '" . $this->db->escape($data['image']) . "' WHERE remont_id = '" . (int)$remont_id . "'");
        }
        foreach ($data['remont_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "remont_description SET remont_id = '" . (int)$remont_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
        }
        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'remont_id=" . (int)$remont_id. "'");
        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'remont_id=" . (int)$remont_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }
        $this->db->query("DELETE FROM " . DB_PREFIX . "remont_to_store WHERE remont_id = '" . (int)$remont_id . "'");
        if (isset($data['remont_store'])) {
            foreach ($data['remont_store'] as $store_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "remont_to_store SET remont_id = '" . (int)$remont_id . "', store_id = '" . (int)$store_id . "'");
            }
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "remont_image WHERE remont_id = '" . (int)$remont_id . "'");

        if (isset($data['remont_image'])) {
            foreach ($data['remont_image'] as $remont_image) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "remont_image SET remont_id = '" . (int)$remont_id . "', image = '" . $this->db->escape(html_entity_decode($remont_image['image'], ENT_QUOTES, 'UTF-8')) . "', description = '{$remont_image['description']}', sort_order = '" . (int)$remont_image['sort_order'] . "'");
            }
        }

        $this->cache->delete('remont');
    }

    protected function getVideoCode($url)
    {
        $parts = parse_url($url);
        parse_str(html_entity_decode($parts['query']), $parsed_query);
        if(!isset($parsed_query['v'])){
            return '';
        }
        return '
            <object width="640" height="360">
                <param name="movie" value="https://www.youtube.com/v/'.$parsed_query['v'].'?version=3"></param>
                <param name="allowFullScreen" value="true"></param>
                <param name="allowScriptAccess" value="always"></param>
                <embed src="https://www.youtube.com/v/'.$parsed_query['v'].'?version=3" type="application/x-shockwave-flash" allowfullscreen="true" allowScriptAccess="always" width="640" height="360"></embed>
            </object>
        ';
    }

    protected function loadVideoThumb($url)
    {
        $parts = parse_url($url);
        parse_str(html_entity_decode($parts['query']), $parsed_query);
        $imageUrl = 'http://img.youtube.com/vi/'.$parsed_query['v'].'/0.jpg';

        $path = DIR_IMAGE . 'data/' . $parsed_query['v'] . '.jpg';
        $fp = fopen($path, 'w');

        $ch = curl_init($imageUrl);
        curl_setopt($ch, CURLOPT_FILE, $fp);

        $data = curl_exec($ch);

        curl_close($ch);
        fclose($fp);

        return 'data/' . $parsed_query['v'] . '.jpg';
    }

    public function deleteRemont($remont_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "remont WHERE remont_id = '" . (int)$remont_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "remont_description WHERE remont_id = '" . (int)$remont_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'remont_id=" . (int)$remont_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "remont_to_store WHERE remont_id = '" . (int)$remont_id . "'");
        $this->cache->delete('remont');
    }

    public function getRemontStory($remont_id) {
        $query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'remont_id=" . (int)$remont_id . "') AS keyword FROM " . DB_PREFIX . "remont WHERE remont_id = '" . (int)$remont_id . "'");
        return $query->row;
    }

    public function getRemontDescriptions($remont_id) {
        $remont_description_data = array();
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "remont_description WHERE remont_id = '" . (int)$remont_id . "'");
        foreach ($query->rows as $result) {
            $remont_description_data[$result['language_id']] = array(
                'title'            => $result['title'],
                'meta_description' => $result['meta_description'],
                'description'      => $result['description']
            );
        }
        return $remont_description_data;
    }

    public function getRemontStores($remont_id) {
        $remontpage_store_data = array();
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "remont_to_store WHERE remont_id = '" . (int)$remont_id . "'");
        foreach ($query->rows as $result) {
            $remontpage_store_data[] = $result['store_id'];
        }
        return $remontpage_store_data;
    }

    public function getRemont() {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "remont n LEFT JOIN " . DB_PREFIX . "remont_description nd ON (n.remont_id = nd.remont_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY n.date_added");
        return $query->rows;
    }

    public function getTotalRemont() {
        $this->checkRemont();
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "remont");
        return $query->row['total'];
    }

    public function getRemontImages($remont_id)
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "remont_image WHERE remont_id = '" . (int)$remont_id . "'");

        return $query->rows;
    }

    public function checkRemont() {
        $create_remont = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "remont` (`remont_id` int(11) NOT NULL auto_increment, `status` int(1) NOT NULL default '0', `type` enum('equipment','water') COLLATE utf8_bin NOT NULL DEFAULT 'equipment', `image` varchar(255) collate utf8_bin default NULL, `image_size` int(1) NOT NULL default '0', `video_youtube` varchar(255) COLLATE utf8_bin NOT NULL, `video_code` text COLLATE utf8_bin NOT NULL, `date_added` datetime default NULL, PRIMARY KEY  (`remont_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
        $this->db->query($create_remont);
        $create_remont_descriptions = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "remont_description` (`remont_id` int(11) NOT NULL default '0', `language_id` int(11) NOT NULL default '0', `title` varchar(64) collate utf8_bin NOT NULL default '', `meta_description` varchar(255) collate utf8_bin NOT NULL, `description` text collate utf8_bin NOT NULL, PRIMARY KEY  (`remont_id`,`language_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
        $this->db->query($create_remont_descriptions);
        $create_remont_to_store = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "remont_to_store` (`remont_id` int(11) NOT NULL, `store_id` int(11) NOT NULL, PRIMARY KEY  (`remont_id`, `store_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
        $this->db->query($create_remont_to_store);

        $create_remont_images = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "remont_image` (  `id` int(11) NOT NULL AUTO_INCREMENT,  `remont_id` int(11) NOT NULL,  `image` varchar(255) NOT NULL, `description` text NOT NULL, `sort_order` int(3) NOT NULL,  PRIMARY KEY (`id`)) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8";
        $this->db->query($create_remont_images);
    }
}
?>