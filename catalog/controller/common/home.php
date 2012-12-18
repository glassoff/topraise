<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');

        $this->data['simple'] = $this->url->link('information/buy-shipping') . "#simple";
        $this->data['comfortable'] = $this->url->link('information/buy-shipping') . "#comfortable";
        $this->data['economicly'] = $this->url->link('information/buy-shipping') . "#economicly";

        $this->load->model('catalog/category');
        $categories = $this->model_catalog_category->getCategories(0);

        $this->data['hrefs'] = array();
        foreach($categories as $category){
            $this->data['hrefs'][$category['category_id']] = $this->url->link('product/category', 'path=' . $category['category_id']);
        }

        $this->data['search_action'] = $this->url->link('product/search');

        $this->document->addScript('catalog/view/theme/topraise/js/jquery.tools.min.js');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header',
		);
										
		$this->response->setOutput($this->render());
	}
}
?>