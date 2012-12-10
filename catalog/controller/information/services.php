<?php
class ControllerInformationServices extends Controller {
    public function index() {
        $this->load->language('information/services');
        $this->load->model('fido/remont');

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'href'      => $this->url->link('common/home'),
            'text'      => $this->language->get('text_home'),
            'separator' => FALSE
        );

        //remonts list

        $type = 'equipment';
        if(isset($this->request->get['type'])){
            $type = $this->request->get['type'];
        }

        $this->load->language('information/services-' . $type);

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $limit = 6; //CONFIG

        $remonts_total = $this->model_fido_remont->getTotalRemont($type);

        $remont_data = $this->model_fido_remont->getRemont($type, ($page - 1) * $limit, $limit);

        $this->data['remont_data'] = array();

        if ($remont_data) {
            foreach ($remont_data as $result) {
                $thumb = false;
                if($result['image']){
                    $this->load->model('tool/image');

                    $thumb = $this->model_tool_image->resize($result['image'], $this->config->get('remont_thumb_width'), $this->config->get('remont_thumb_height'));
                }
                else{
                    $thumb = HTTP_SERVER . 'catalog/view/theme/topraise/images/default-mount.jpg';
                }

                $this->data['remont_data'][] = array(
                    'title'        => $result['title'],
                    'description'  => substr(html_entity_decode($result['description']), 0, $this->config->get('remont_headline_chars')),
                    'href'         => $this->url->link('information/mount', 'remont_id=' . $result['remont_id']),
                    'date_added'   => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                    'thumb' => $thumb,
                    'video_code' => $result['video_code'],
                );
            }
        }

        $this->document->setTitle($this->language->get('heading_title'));

        $this->document->breadcrumbs[] = array(
            'href'      => $this->url->link('information/remont'),
            'text'      => $this->language->get('heading_title'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text'] = $this->language->get('text');

        $this->data['text_read_more'] = $this->language->get('text_read_more');
        $this->data['text_date_added'] = $this->language->get('text_date_added');

        $this->data['button_continue'] = $this->language->get('button_continue');

        $this->data['continue'] = $this->url->link('common/home');

        $pagination = new Pagination();
        $pagination->total = $remonts_total;
        $pagination->page = $page;
        $pagination->limit = $limit;
        $pagination->url = $this->url->link('information/services', '&type='.$type.'&page={page}');

        $this->data['pagination'] = $pagination->render();


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/services.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/information/services.tpl';
        } else {
            $this->template = 'default/template/information/services.tpl';
        }

        $this->children = array(
            'common/column_left',
            'common/column_right',
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header',
            'information/mount_request',
        );

        $this->response->setOutput($this->render());

    }

}
?>
