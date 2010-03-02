<?php
App::import('Model', 'Book');

class BookTestCase extends CakeTestCase {
	var $fixtures = array('app.author', 'app.book', 'app.books_author');

	function startTest() {
		$this->Book =& ClassRegistry::init('Book');
		$this->Book->create(array('title' => null));

		$this->Author =& ClassRegistry::init('Author');
		$this->Authors = $this->Author->find('all');
	}

	function endTest() {
		unset($this->Book);
		ClassRegistry::flush();
	}
	
	var $requiredAttributes = array(
		'Book' => array(
			'title' => "Planning Extreme Programming"
		)
	);

	function testValidAttributes() {
		$this->Book->set($this->requiredAttributes);
		$this->assertTrue($this->Book->save(), 'should save'); 
		$this->assertTrue($this->Book->findById($this->Book->id) != false, "should find");
		
	}

	function testInvalidAttributes() {
		$this->assertFalse($this->Book->validates(), 'should be invalid');
		$errors = $this->Book->invalidFields();
		$this->assertNotNull($errors['title'], 'should have error on title');
	}
	
	function testHasManyAuthors() {
		$this->requiredAttributes['Author']['Author'] = array(1, 2);
		$this->Book->set($this->requiredAttributes);
		$this->assertTrue($this->Book->validates(), 'should be valid with 2 authors');
		$this->assertEqual(2, 
			sizeof($this->Book->data['Author']['Author']), 'should have 2 authors');
		$this->assertTrue($this->Book->saveAll(), 'should save');
		$book = $this->Book->findById($this->Book->id);
		$this->assertTrue(sizeof($book['Author']) == 2, 'should find 2 author');
	}

}
?>