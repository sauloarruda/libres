<?php
class BooksController extends AppController {

    var $name = 'Books';
    var $helpers = array('Javascript');

    function index() {
        $this->set("authorsForLookup", json_encode(array_values($this->Book->Author->find('list'))));
    }

}
?>