<?php
class ModelCatalogCategory extends Model {
	public function getCategory($category_id) {
		return $this->getCategories((int)$category_id, 'by_id');
	}

	public function getCategories($id = 0, $type = 'by_parent') {
		static $data = null;

		if ($data === null) {
			$data = array();

			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1' ORDER BY c.parent_id, c.sort_order, cd.name");

			foreach ($query->rows as $row) {
				$data['by_id'][$row['category_id']] = $row;
				$data['by_parent'][$row['parent_id']][] = $row;
			}
		}

		return ((isset($data[$type]) && isset($data[$type][$id])) ? $data[$type][$id] : array());
	}

	public function getCategoriesByParentId($category_id) {
		$category_data = array();

		$categories = $this->getCategories((int)$category_id);

		foreach ($categories as $category) {
			$category_data[] = $category['category_id'];

			$children = $this->getCategoriesByParentId($category['category_id']);

			if ($children) {
				$category_data = array_merge($children, $category_data);
			}
		}

		return $category_data;
	}

	public function getCategoryLayoutId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_layout WHERE category_id = '" . (int)$category_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return $this->config->get('config_layout_category');
		}
	}

	public function getTotalCategoriesByCategoryId($parent_id = 0) {
		return count($this->getCategories((int)$parent_id));
	}

    public function getStartCategory()
    {
        $categories = $this->getCategories(0);
        return $categories[0]['category_id'];
    }

    public function getParentCategory($category_id)
    {
        $query = $this->db->query("SELECT parent_id FROM " . DB_PREFIX . "category WHERE category_id='{$category_id}'");
        return $query->row['parent_id'];
    }

    public function getCategoryPriceLimits($category_id)
    {
        $sql = "SELECT MAX(p.price) as max, MIN(p.price) as min FROM " . DB_PREFIX . "product p
            JOIN " . DB_PREFIX . "product_to_category p_c ON (p_c.product_id = p.product_id)
            WHERE (p_c.category_id = {$category_id})";

        $query = $this->db->query($sql);

        return $query->row;
    }

    public function getManufacturersForFilter($category_id)
    {
        $manufacturers = $this->cache->get('category_filter_manufacturers.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $category_id);

        if(!$manufacturers){
            $sql = "
            SELECT m.manufacturer_id, m.name FROM product p
            JOIN manufacturer m ON (m.manufacturer_id = p.manufacturer_id)
            JOIN product_to_category p_c ON (p_c.product_id = p.product_id)
            WHERE (p_c.category_id = {$category_id})
            GROUP BY p.manufacturer_id
            ORDER BY m.name
            ";

            $query = $this->db->query($sql);

            $manufacturers = array();
            foreach ($query->rows as $row) {
                $manufacturers[] = array(
                    'name' => 'manufacturers',
                    'text' => $row['name'],
                    'value' => $row['manufacturer_id'],
                    'selected' => false
                );
            }

            $this->cache->set('category_filter_manufacturers.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $category_id, $manufacturers);
        }

        return $manufacturers;
    }

    public function getSizesForFilter($category_id)
    {
        $sizes = $this->cache->get('category_filter_sizes.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $category_id);

        if(!$sizes){

            $sql = "
            SELECT CONCAT_WS('x', p.length, p.width, p.height) as sizes, p.length, p.width, p.height FROM product p
            JOIN product_to_category p_c ON (p_c.product_id = p.product_id)
            WHERE (p_c.category_id = {$category_id} AND (p.length > 0 OR p.width > 0 OR p.height > 0))
            GROUP BY sizes
            ORDER BY sizes
            ";

            $query = $this->db->query($sql);

            $sizes = array();
            foreach ($query->rows as $row) {
                $sizes[] = array(
                    'name' => 'sizes',
                    'text' => floatval($row['height']) . 'x' . floatval($row['width']) . 'x' . floatval($row['length']),
                    'value' => $row['height'] . 'x' . $row['width'] . 'x' . $row['length'],
                    'selected' => false
                );
            }

            $this->cache->set('category_filter_sizes.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $category_id, $sizes);
        }

        return $sizes;
    }

    public function getAttributesForFilter($category_id)
    {
        $attributes = $this->cache->get('category_filter_attributes.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $category_id);

        if(!$attributes){

            $sql = "
            SELECT a_d.*, p_a.text FROM attribute_description a_d
            JOIN product_attribute p_a ON (p_a.attribute_id = a_d.attribute_id)
            JOIN product_to_category p_c ON (p_c.product_id = p_a.product_id)
            WHERE (p_c.category_id = {$category_id} AND CHAR_LENGTH(p_a.text) < 30)
            GROUP BY p_a.text
            ORDER BY a_d.name
            ";

            $query = $this->db->query($sql);

            $attributes = array();
            foreach ($query->rows as $row) {
                $attributes[$row['name']][] = array(
                    'attribute_id' => $row['attribute_id'],
                    'name' => 'attr'.$row['attribute_id'],
                    'text' => $row['text'],
                    'value' => $row['text'],
                    'selected' => false
                );
            }

            $this->cache->set('category_filter_attributes.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $category_id, $attributes);
        }

        return $attributes;
    }

    public function getMainCategory($category_id)
    {
        $parent_id = $this->getParentCategory($category_id);
        if($parent_id > 0){
            return $this->getMainCategory($parent_id);
        }
        return $category_id;
    }
}
?>