<?php
class ControllerModuleTtTestimonials extends Controller {

    public function index() {

        static $module = 0;		

        $this->load->model('module/tt_testimonials');
        $this->load->language('module/tt_testimonials');

        $data['heading_title'] = $this->language->get('heading_title');

        $this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
        $this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
        $this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.transitions.css');

        $this->document->addStyle('catalog/view/theme/default/css/tt_testimonials.css');


        $data['tt_testimonials'] = $this->model_module_tt_testimonials->getTestimonials();

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        $data['module'] = $module++;

        return $this->load->view('module/tt_testimonials', $data);
    }
}
