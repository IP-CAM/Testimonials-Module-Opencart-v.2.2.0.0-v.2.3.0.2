<?php
class ModelModuleTtTestimonials extends Model {

    /**
     * Add Schema
    */
    public function addSchema() {
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "tt_testimonials (
            id int(64) UNSIGNED NOT NULL,
            testimonial_id int(64) UNSIGNED NOT NULL,
            language_id int(11) NOT NULL,
            testimonial_advice text CHARACTER SET utf8 NOT NULL,
            testimonial_by varchar(64) CHARACTER SET utf8 DEFAULT NULL,
            sort int(3) DEFAULT '0',
            status int(2) DEFAULT '1'
            )ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
        ");
    }


    /**
     * Save Testimonials
    */
    public function save($data) {

        if (isset($data['tt_testimonial'])) {

            /*foreach($data['tt_testimonial'] as $tt_testimonial => $testimonial) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "tt_testimonials SET testimonial_id = '" . (int)$this->db->escape($testimonial['testimonial_id']) . "', testimonial_advice = '" .  $this->db->escape($testimonial['advice']) . "', testimonial_by = '" . $this->db->escape($testimonial['by']) . "', sort = '" . (int)$testimonial['sort_order'] . "' ON DUPLICATE KEY UPDATE testimonial_id = '" . (int)$this->db->escape($testimonial['testimonial_id']) . "', testimonial_advice = '" .  $this->db->escape($testimonial['advice']) . "', testimonial_by = '" . $this->db->escape($testimonial['by']) . "', sort = '" . (int)$this->db->escape($testimonial['sort_order']) . "', status = '" . (int)$this->db->escape($testimonial['status']) . "'");
            }*/

            $this->db->query("DELETE FROM " . DB_PREFIX . "tt_testimonials");

            foreach($data['tt_testimonial'] as $testimonial) {

                foreach ($testimonial['language_id'] as $language_id => $language) {
                    $this->db->query("
                        INSERT INTO " . DB_PREFIX . "tt_testimonials SET 
                        testimonial_id = '" . (int)$this->db->escape($testimonial['testimonial_id']) . "',  
                        language_id = '" . (int)$this->db->escape($language_id) . "',  
                        testimonial_advice = '" . $this->db->escape($language['advice']) . "',  
                        testimonial_by = '" . $this->db->escape($language['by']) . "', 
                        sort = '" . (int)$this->db->escape($testimonial['sort_order']) . "', 
                        status = '" . (int)$this->db->escape($testimonial['status']) . "'
                    ");
                }
            }
        }
    }


    /**
     * Delete Testimonial
    */
    public function delete($data) {
        $query = $this->db->query("DELETE FROM " . DB_PREFIX . "tt_testimonials WHERE testimonial_id = '" . (int)$data['testimonial_id'] . "'");
    }


    /**
     * Get All Testimonials
    */
    public function getTestimonials() {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tt_testimonials ORDER BY sort ASC");

        $data = [];
        $testimonial_data = [];

        foreach ($query->rows as $row) {

            $languages[$row['language_id']] = [
                'testimonial_advice' => $row['testimonial_advice'],
                'testimonial_by' => $row['testimonial_by'],
            ];

            $testimonial_data[$row['testimonial_id']] = [
                'testimonial_id' => $row['testimonial_id'],
                'language_id' => $languages,
                'sort' => $row['sort'],
                'status' => $row['status'],
            ];
        }

        return $testimonial_data;
    }
}
