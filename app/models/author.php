<?php
class Author extends AppModel {
	var $name = 'Author';
	var $displayField = 'name';
	
        var $validate = array(
            'name' => array(
                'rule' => array('custom', '/^[a-z ]+$/i'),
                'required' => true
            )
        );
        
	var $hasAndBelongsToMany = array(
            'Book' => array('joinTable' => 'books_authors')
	);

}
?>