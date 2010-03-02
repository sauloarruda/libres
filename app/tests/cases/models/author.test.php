<?php
/* Author Test cases generated on: 2010-03-02 16:03:58 : 1267563118*/
App::import('Model', 'Author');

class AuthorTestCase extends CakeTestCase {
	var $fixtures = array('app.author', 'app.book', 'app.books_author');

	function startTest() {
		$this->Author =& ClassRegistry::init('Author');
	}

	function endTest() {
		unset($this->Author);
		ClassRegistry::flush();
	}

}
?>