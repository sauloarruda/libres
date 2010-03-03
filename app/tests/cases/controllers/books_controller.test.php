<?php
class BooksControllerTest extends CakeTestCase {

    function assertTags($pattern, $subject, $message) {
        if (!is_array($pattern)) $this->assertTrue(preg_match($pattern, $subject), $message);
        else {
            $key = array_shift($pattern);
            $string = "";

            foreach($pattern as $k => $p) $string .= $k."=\"".$p."\" ";

            $string = sprintf("input %s", $string);
            
            return $this->assertTrue(
                strpos($subject, $string) !== false, $message);
        }
    }

    var $fixtures = array('app.author', 'app.book', 'app.books_author');

    function startCase() {
        echo '<h1>Starting Test Case</h1>';
    }
    function endCase() {
        echo '<h1>Ending Test Case</h1>';
    }
    function startTest($method) {
        echo '<h3>Starting method ' . $method . '</h3>';
    }
    function endTest($method) {
        echo '<hr />';
    }

    function testNewBook() {
        $result = $this->testAction('/books/index',
            array('return' => 'content'));
        $this->assertTags('/<h1>New Book<\/h1>/i', $result,
            'should contain \'New Book\' on screen');
        $this->assertTags(
            array('input',
                'name' => 'data[title]', 'type' => 'text',
                'value' => '', 'id' => 'title'
            ),
            $result, 'should contain input \'title\' on screen'
        );
    }

    function testAuthorsAutoComplete() {
        $result = $this->testAction('/books/index',
            array('return' => 'content'));
        $this->assertTags(
            array('input',
                'name' => 'data[authors]', 'type' => 'text',
                'value' => '', 'id' => 'authors'
            ),
            $result, 'should contain input \'authors\' on screen'
        );
        $this->assertTags("/new Autocompleter.Local\('authors', 'authors_lookup_auto_complete', \[\\\"Kent Beck\\\",\\\"Martin Fowler\\\"\], \{ tokens: ',' \}\);/i",
            $result, "should have auto-complete enabled");
    }

}