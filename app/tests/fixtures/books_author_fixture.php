<?php
/* BooksAuthor Fixture generated on: 2010-03-02 18:03:33 : 1267568733 */
class BooksAuthorFixture extends CakeTestFixture {
	var $name = 'BooksAuthor';

	var $fields = array(
		'book_id' => array('type' => 'integer', 'null' => false, 'default' => NULL),
		'author_id' => array('type' => 'integer', 'null' => false, 'default' => NULL),
		'indexes' => array('PRIMARY' => array('column' => array('book_id', 'author_id'))),
		'tableParameters' => array('charset' => 'latin1', 'collate' => 'latin1_swedish_ci', 'engine' => 'InnoDB')
	);

	var $records = array(
	);
}
?>