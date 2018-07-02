<?php
class ControllerModuleTtTestimonials extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('module/tt_testimonials');
        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');
        $this->load->model('module/tt_testimonials');
        $this->load->model('localisation/language');

        $this->model_module_tt_testimonials->addSchema();

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->model_setting_setting->editSetting('tt_testimonials', $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');

            //$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
        }

        $this->getForm();
    }


    protected function getForm() {

        // Load model
        $this->load->model('module/tt_testimonials');
        $data['testimonials'] = $this->model_module_tt_testimonials->getTestimonials();

        // echo '<pre>';
        // print_r($data['testimonials']);
        // echo '</pre>';

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_advice'] = $this->language->get('entry_advice');
        $data['entry_advice_by'] = $this->language->get('entry_advice_by');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['button_remove'] = $this->language->get('button_remove');
        $data['button_testimonial_add'] = $this->language->get('button_testimonial_add');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        $data['token'] = $this->session->data['token'];


        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/tt_testimonials', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('module/tt_testimonials/edit', 'token=' . $this->session->data['token'], true);
        $data['action2'] = $this->url->link('module/tt_testimonials', 'token=' . $this->session->data['token'], true);
        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

        if (isset($this->request->post['tt_testimonials_status'])) {
            $data['tt_testimonials_status'] = $this->request->post['tt_testimonials_status'];
        } else {
            $data['tt_testimonials_status'] = $this->config->get('tt_testimonials_status');
        }


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');


        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->language->get('text_success');
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $this->response->setOutput($this->load->view('module/tt_testimonials', $data));
    }


    /**
     * Edit
    */
    public function edit() {

        global $url;

        $this->load->model('module/tt_testimonials');

        $this->model_module_tt_testimonials->save($this->request->post);
        $this->session->data['success'] = $this->language->get('text_success');

        $this->response->redirect($this->url->link('module/tt_testimonials', 'token=' . $this->session->data['token'] . $url, true));
    }


    /**
     * Delete
    */
    public function delete() {

        $this->load->language('module/tt_testimonials');
        $this->load->model('module/tt_testimonials');


        if (isset($this->request->get['testimonial_id'])) {
            $data['testimonial_id'] = $this->request->get['testimonial_id'];
        }

        $this->model_module_tt_testimonials->delete($data);

    }


    /**
     * Validate
    */
    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/tt_testimonials')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}