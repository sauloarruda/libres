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

    var $requiredAttributes = array(
            'Author' => array(
                'name' => "Kent Beck"
            )
    );

    function testValidAttributes() {
        $this->Author->set($this->requiredAttributes);
        $this->assertTrue($this->Author->save(), 'should save');
        $this->assertTrue($this->Author->findById($this->Author->id) != false, "should find");

    }

    function testInvalidAttributes() {
        $this->assertFalse($this->Author->validates(), 'should be invalid');
        $errors = $this->Author->invalidFields();
        $this->assertNotNull($errors['name'], 'should have error on name');
    }

}
?>