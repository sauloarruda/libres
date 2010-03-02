<?php
/* Author Fixture generated on: 2010-03-02 16:03:57 : 1267563117 */
class AuthorFixture extends CakeTestFixture {
	var $name = 'Author';

	var $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'key' => 'primary'),
		'name' => array('type' => 'string', 'null' => false, 'default' => NULL),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1)),
		'tableParameters' => array('charset' => 'latin1', 'collate' => 'latin1_swedish_ci', 'engine' => 'InnoDB')
	);

	var $records = array(
		array('id' => 1, 'name' => 'Kent Beck'),
		array('id' => 2, 'name' => 'Martin Fowler')
	);
}
?>