<?php  
class ControllerModuleCategory extends Controller {
	protected function index($setting) {
		$this->language->load('module/category');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['category_id'] = $parts[0];
		} else {
			$this->data['category_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}

        if (isset($parts[2])) {
            $this->data['child3_id'] = $parts[2];
        } else {
            $this->data['child3_id'] = 0;
        }
							
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		
		$this->data['categories'] = array();
					
		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			$children_data = array();

            if($category['category_id'] == $this->data['category_id']){
                //second
                $children = $this->model_catalog_category->getCategories($category['category_id']);

                foreach ($children as $child) {
                    $children3_data = array();
                    if($child['category_id'] == $this->data['child_id']){
                        //third
                        $children3 = $this->model_catalog_category->getCategories($child['category_id']);

                        foreach($children3 as $child3){
                            $data = array(
                                'filter_category_id'  => $child3['category_id'],
                                'filter_sub_category' => true
                            );

                            if ($setting['count']) {
                                $product_total = $this->model_catalog_product->getTotalProducts($data);

                                $children3_data[] = array(
                                    'category_id' => $child3['category_id'],
                                    'name'        => $child3['name'] . ' (' . $product_total . ')',
                                    'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child3['category_id'])
                                );
                            } else {
                                $children3_data[] = array(
                                    'category_id' => $child3['category_id'],
                                    'name'        => $child3['name'],
                                    'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child3['category_id'])
                                );
                            }
                        }
                    }

                    $data = array(
                        'filter_category_id'  => $child['category_id'],
                        'filter_sub_category' => true
                    );

                    if ($setting['count']) {
                        $product_total = $this->model_catalog_product->getTotalProducts($data);

                        $children_data[] = array(
                            'category_id' => $child['category_id'],
                            'name'        => $child['name'] . ' (' . $product_total . ')',
                            'children'    => $children3_data,
                            'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                        );
                    } else {
                        $children_data[] = array(
                            'category_id' => $child['category_id'],
                            'name'        => $child['name'],
                            'children'    => $children3_data,
                            'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                        );
                    }
                }
            }

			
			$data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true	
			);		
			
			if ($setting['count']) {
				$product_total = $this->model_catalog_product->getTotalProducts($data);
			
				$this->data['categories'][] = array(
					'category_id' => $category['category_id'],
					'name'        => $category['name'] . ' (' . $product_total . ')',
					'children'    => $children_data,
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
				);				
			} else {
				$this->data['categories'][] = array(
					'category_id' => $category['category_id'],
					'name'        => $category['name'],
					'children'    => $children_data,
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
				);			
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/category.tpl';
		} else {
			$this->template = 'default/template/module/category.tpl';
		}
		
		$this->render();
  	}
}
?>