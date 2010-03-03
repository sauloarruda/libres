<?php
class Book extends AppModel {
	var $name = 'Book';
	var $displayField = 'title';
        
	var $validate = array(
            'title' => array(
                'rule' => array('custom', '/^[0-9a-z ]+$/i'),
                'required' => true,
                'message' => 'Title cannot be blank'
            )
        );

	var $hasAndBelongsToMany = array('Author' => array('joinTable' => 'books_authors'));

}
?>