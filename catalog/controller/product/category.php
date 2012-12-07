<?php 
class ControllerProductCategory extends Controller {  
	public function index() { 
		$this->language->load('product/category');
		
		$this->load->model('catalog/category');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image'); 
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
							
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}
					
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);

        $this->document->addScript('catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js');
        $this->document->addStyle('catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css');

        $this->document->addScript('catalog/view/theme/topraise/js/catalog.js');
        $this->data['filter_url'] = $this->url->link('product/category/filter');
			
		if (isset($this->request->get['path'])) {
			$path = '';
		
			$parts = explode('_', (string)$this->request->get['path']);
		
			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}
									
				$category_info = $this->model_catalog_category->getCategory($path_id);
				
				if ($category_info) {
	       			$this->data['breadcrumbs'][] = array(
   	    				'text'      => $category_info['name'],
						'href'      => $this->url->link('product/category', 'path=' . $path),
        				'separator' => $this->language->get('text_separator')
        			);
				}
			}		
		
			$category_id = array_pop($parts);
		} else {
            $category_id = $this->model_catalog_category->getStartCategory();
            $url = $this->url->link('product/category', 'path=' . $category_id);
            $this->response->redirect( str_replace('&amp;', '&', $url) );
			//$category_id = 0;

		}
		
		$category_info = $this->model_catalog_category->getCategory($category_id);
	
		if ($category_info) {
			if ($category_info['seo_title']) {
		  		$this->document->setTitle($category_info['seo_title']);
			} else {
		  		$this->document->setTitle($category_info['name']);
			}

			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);
			
			$this->data['seo_h1'] = $category_info['seo_h1'];

			$this->data['heading_title'] = $category_info['name'];
			
			$this->data['text_refine'] = $this->language->get('text_refine');
			$this->data['text_empty'] = $this->language->get('text_empty');			
			$this->data['text_quantity'] = $this->language->get('text_quantity');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_points'] = $this->language->get('text_points');
			$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$this->data['text_display'] = $this->language->get('text_display');
			$this->data['text_list'] = $this->language->get('text_list');
			$this->data['text_grid'] = $this->language->get('text_grid');
			$this->data['text_sort'] = $this->language->get('text_sort');
			$this->data['text_limit'] = $this->language->get('text_limit');
					
			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');
			$this->data['button_continue'] = $this->language->get('button_continue');
					
			if ($category_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
			} else {
				$this->data['thumb'] = HTTP_SERVER . 'catalog/view/theme/topraise/images/default-product.jpg';
			}
									
			$this->data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['compare'] = $this->url->link('product/compare');
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

            //get subcategories
			$this->data['categories'] = array();
			
			$results = $this->model_catalog_category->getCategories($category_id);
			
			foreach ($results as $result) {
				$data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true	
				);
							
				$product_total = $this->model_catalog_product->getTotalProducts($data);
				
				$this->data['categories'][] = array(
					'name'  => $result['name'] . ' (' . $product_total . ')',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url),
                    'main_product' => $this->processProduct($this->model_catalog_product->getCategoryMainProduct($result['category_id'])),
				);
			}

            //get category products
			$this->data['products'] = array();
			
			$data = array(
				'filter_category_id' => $category_id, 
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);

            $filter_data = $this->getFilterData();
            $data = array_merge($data, $filter_data);
					
			$product_total = $this->model_catalog_product->getTotalProducts($data);
			
			$results = $this->model_catalog_product->getProducts($data);
			
			foreach ($results as $result) {
				$this->data['products'][] = $this->processProduct($result);
			}
			
			$url = '';
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
							
			$this->data['sorts'] = array();
			
			/*$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);*/
			
			/*$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);*/

			/*$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);*/

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			); 

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			); 
			
			/*if ($this->config->get('config_review_status')) {
				$this->data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				); 
				
				$this->data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}*/
			
			/*$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);*/
			
			$url = '';
	
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->data['limits'] = array();
			
			$this->data['limits'][] = array(
				'text'  => $this->config->get('config_catalog_limit'),
				'value' => $this->config->get('config_catalog_limit'),
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $this->config->get('config_catalog_limit'))
			);
						
			$this->data['limits'][] = array(
				'text'  => 25,
				'value' => 25,
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=25')
			);
			
			$this->data['limits'][] = array(
				'text'  => 50,
				'value' => 50,
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=50')
			);

			$this->data['limits'][] = array(
				'text'  => 75,
				'value' => 75,
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=75')
			);
			
			$this->data['limits'][] = array(
				'text'  => 100,
				'value' => 100,
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=100')
			);
						
			$url = '';
	
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
					
			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');
		
			$this->data['pagination'] = $pagination->render();
		
			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;
		
			$this->data['continue'] = $this->url->link('common/home');

            $this->data['category_id'] = $category_id;


            $open_filter = false;

            //price limits
            $price_limits = $this->model_catalog_category->getCategoryPriceLimits($category_id);
            $this->data['price_limits'] = $price_limits;

            $this->data['filter_min_price'] = $filter_data['filter_price_min'] ? $filter_data['filter_price_min'] : floatval($price_limits['min']);
            $this->data['filter_max_price'] = $filter_data['filter_price_max'] ? $filter_data['filter_price_max'] : floatval($price_limits['max']);
            if($filter_data['filter_price_min'] || $filter_data['filter_price_max']){
                $open_filter = true;
            }

            //manufactures XXX
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

            foreach($filter_data['filter_manufacturers'] as $manufacturer_id){
                foreach($manufacturers as & $_data){
                    if($_data['value'] == $manufacturer_id){
                        $_data['selected'] = true;
                        $open_filter = true;
                    }
                }
            }

            //sizes XXX
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

            foreach($filter_data['filter_sizes'] as $size){
                foreach($sizes as & $_data){
                    if($_data['value'] == $size){
                        $_data['selected'] = true;
                        $open_filter = true;
                    }
                }
            }

            //attributes XXX
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

            foreach($attributes as & $values){
                foreach($values as & $_data){
                    if(isset($filter_data['filter_attributes'][$_data['attribute_id']]) && in_array($_data['value'], $filter_data['filter_attributes'][$_data['attribute_id']])){
                        $_data['selected'] = true;
                        $open_filter = true;
                    }
                }
            }

            $filters = array();
            if(count($manufacturers)){
                $filters['Производители'] = $manufacturers;
            }
            if(count($sizes)){
                $filters['Размеры'] = $sizes;
            }
            $this->data['filters'] = array_merge($filters, $attributes);

            $this->data['open_filter'] = $open_filter;


			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/category.tpl';
			} else {
				$this->template = 'default/template/product/category.tpl';
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
            //not found category
			$url = '';
			
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
									
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
				
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
						
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/category', $url),
				'separator' => $this->language->get('text_separator')
			);
				
			$this->document->setTitle($this->language->get('text_error'));

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

    protected function processProduct($result)
    {
        if ($result['image']) {
            $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
        } else {
            $image = HTTP_SERVER . 'catalog/view/theme/topraise/images/default-product.jpg';
        }

        if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
            $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
        } else {
            $price = false;
        }

        if ((float)$result['special']) {
            $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
        } else {
            $special = false;
        }

        if ($this->config->get('config_tax')) {
            $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
        } else {
            $tax = false;
        }

        if ($this->config->get('config_review_status')) {
            $rating = (int)$result['rating'];
        } else {
            $rating = false;
        }

        return array(
            'product_id'  => $result['product_id'],
            'thumb'       => $image,
            'name'        => $result['name'],
            'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
            'price'       => $price,
            'special'     => $special,
            'tax'         => $tax,
            'rating'      => $result['rating'],
            'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
            'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'])
        );
    }

    protected function getFilterData()
    {
        $filter_manufacturers = array();
        $filter_sizes = array();
        $filter_attributes = array();
        $filter_price_min = 0;
        $filter_price_max = 0;

        foreach($this->request->get as $k => $v){
            if(preg_match('/^filter(.+)/is', $k, $match)){
                $filterType = $match[1];
                switch($filterType){
                    case 'manufacturers':
                        foreach((array)$v as $_v){
                            $filter_manufacturers[] = (int)$_v;
                        }
                        break;
                    case 'sizes':
                        foreach((array)$v as $_v){
                            $filter_sizes[] = $_v;
                        }
                        break;
                    case 'price-min':
                        $filter_price_min = floatval($v);
                        break;
                    case 'price-max':
                        $filter_price_max = floatval($v);
                        break;
                    default:
                        if(preg_match('/^attr(\d+)/is', $filterType, $match)){
                            foreach((array)$v as $_v){
                                $filter_attributes[$match[1]][] = $_v;
                            }
                        }
                        break;
                }
            }
        }

        $data = array(
            'filter_manufacturers' => $filter_manufacturers,
            'filter_sizes' => $filter_sizes,
            'filter_attributes' => $filter_attributes,
            'filter_price_min' => $filter_price_min,
            'filter_price_max' => $filter_price_max,
        );

        return $data;

    }

    public function filter()
    {
        $json = array('result' => 0);

        if(isset($this->request->get['category'])){

            $category_id = $this->request->get['category'];

            $this->load->model('catalog/product');
            $this->load->helper('functions');

            $data = $this->getFilterData();
            $data = array_merge($data, array('filter_category_id' => $category_id));

            $product_total = $this->model_catalog_product->getTotalProducts($data);

            $json['html'] = 'Найден'.foundedFormat($product_total).' '.$product_total.' ' . productsFormat($product_total);
            $json['result'] = 'ok';
            $json['count'] = $product_total;

            if($product_total > 0){
                $json['html'] .= ' <a href="'.$this->buildFilterUrl($category_id).'">Показать</a>';
            }

            $json['html'] .= '<br><br>';
        }

        $this->response->setOutput(json_encode($json));
    }

    protected function buildFilterUrl($category_id)
    {
        $params = array();
        foreach($this->request->get as $k => $v){
            if(preg_match('/^filter(.+)/is', $k, $match)){
                $params[$k] = $v;
            }
        }
        $q = http_build_query($params);

        $this->load->model('catalog/category');

        $parent_id = $this->model_catalog_category->getParentCategory($category_id);

        if($parent_id){
            $path = $parent_id . "_" . $category_id;
        }
        else{
            $path = $category_id;
        }

        $url = $this->url->link('product/category', 'path=' . $path . '&' . $q);

        return $url;
    }
}
?>