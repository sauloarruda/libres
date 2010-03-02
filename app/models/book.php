<?php
class Book extends AppModel {
	var $name = 'Book';
	var $displayField = 'title';
	var $validate = array(
		'title' => array('notempty')
		);

	var $hasAndBelongsToMany = array('Author' => array('joinTable' => 'books_authors'));

}
?>