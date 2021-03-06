<?php
class ControllerInformationNews extends Controller {
	public function index() {
    	$this->load->language('information/news');
		$this->load->model('fido/news');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home'),
			'text'      => $this->language->get('text_home'),
			'separator' => FALSE
		);

		if (isset($this->request->get['news_id'])) {
			$news_id = $this->request->get['news_id'];
		} else {
			$news_id = 0;
		}

		$news_info = $this->model_fido_news->getNewsStory($news_id);

		if ($news_info) {
	  		$this->document->setTitle($news_info['title']);

			$this->data['breadcrumbs'][] = array(
				'href'      => $this->url->link('information/news'),
				'text'      => $this->language->get('heading_title'),
				'separator' => $this->language->get('text_separator')
			);

			$this->data['breadcrumbs'][] = array(
				'href'      => $this->url->link('information/news', 'news_id=' . $this->request->get['news_id']),
				'text'      => $news_info['title'],
				'separator' => $this->language->get('text_separator')
			);

     		$this->data['news_info'] = $news_info;

     		$this->data['heading_title'] = $news_info['title'];

			$this->document->setDescription($news_info['meta_description']);

			$this->data['description'] = html_entity_decode($news_info['description']);

			$this->load->model('tool/image');

			if ($news_info['image']) {
				$this->data['image'] = TRUE;
			} else {
				$this->data['image'] = FALSE;
			}

            $this->data['date_added'] = date($this->language->get('date_format_short'), strtotime($news_info['date_added']));

			$this->data['min_height'] = $this->config->get('news_thumb_height');

			$this->data['thumb'] = $this->model_tool_image->resize($news_info['image'], $this->config->get('news_thumb_width'), $this->config->get('news_thumb_height'));
			$this->data['popup'] = $this->model_tool_image->resize($news_info['image'], $this->config->get('news_popup_width'), $this->config->get('news_popup_height'));

     		$this->data['button_news'] = $this->language->get('button_news');

			$this->data['news'] = $this->url->link('information/news');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/news.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/information/news.tpl';
			} else {
				$this->template = 'default/template/information/news.tpl';
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

            if (isset($this->request->get['page'])) {
                $page = $this->request->get['page'];
            } else {
                $page = 1;
            }

            $limit = 6; //CONFIG

            $news_total = $this->model_fido_news->getTotalNews();
	  		$news_data = $this->model_fido_news->getNews(($page - 1) * $limit, $limit);

	  		if ($news_data) {
				foreach ($news_data as $result) {
                    $thumb = false;
                    if($result['image']){
                        $this->load->model('tool/image');

                        $thumb = $this->model_tool_image->resize($result['image'], $this->config->get('news_thumb_width'), $this->config->get('news_thumb_height'));
                    }
					$this->data['news_data'][] = array(
						'title'        => $result['title'],
						'description'  => utf8_substr(strip_tags(html_entity_decode($result['description'])), 0, $this->config->get('news_headline_chars')),
						'href'         => $this->url->link('information/news', 'news_id=' . $result['news_id']),
						'date_added'   => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                        'thumb' => $thumb,
					);
				}

				$this->document->setTitle($this->language->get('heading_title'));

				$this->document->breadcrumbs[] = array(
					'href'      => $this->url->link('information/news'),
					'text'      => $this->language->get('heading_title'),
					'separator' => $this->language->get('text_separator')
				);

				$this->data['heading_title'] = $this->language->get('heading_title');

				$this->data['text_read_more'] = $this->language->get('text_read_more');
				$this->data['text_date_added'] = $this->language->get('text_date_added');

				$this->data['button_continue'] = $this->language->get('button_continue');

				$this->data['continue'] = $this->url->link('common/home');

                  $pagination = new Pagination();
                  $pagination->total = $news_total;
                  $pagination->page = $page;
                  $pagination->limit = $limit;
                  $pagination->url = $this->url->link('information/news', '&page={page}');

                  $this->data['pagination'] = $pagination->render();

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/news.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/information/news.tpl';
				} else {
					$this->template = 'default/template/information/news.tpl';
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
		  		$this->document->setTitle($this->language->get('text_error'));

	     		$this->document->breadcrumbs[] = array(
	        		'href'      => $this->url->link('information/news'),
	        		'text'      => $this->language->get('text_error'),
	        		'separator' => $this->language->get('text_separator')
	     		);

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
	}
}
?>
