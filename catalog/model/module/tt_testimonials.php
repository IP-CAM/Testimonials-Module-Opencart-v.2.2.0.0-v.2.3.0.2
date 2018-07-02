<?php
class ModelModuleTtTestimonials extends Model {

    public function getTestimonials() {
        // $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "testimonials_tt WHERE status = 1");
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tt_testimonials WHERE testimonial_advice <> '' AND status = 1 AND language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort ASC");

        return $query->rows;
    }
}