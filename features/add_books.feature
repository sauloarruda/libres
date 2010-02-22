Feature: Add books
  In order to add books to repository
  As a regular user
  I want to add and edit books

	Background:
		Given I'm on new book page
			Then I should see "New Book"

	Scenario: Add Book with all fields
		When I fill in "Title" with "The RSpec Book"
			And fill in "Authors" on "David Chelimsky, Dave Astels, Zach Dennis, Aslak Hellesøy, Bryan Helmkamp, Dan North"
			And fill in "Authors" on "rails, ruby, rspec, bdd, tdd, teste, cucumber, selenium, webrat"
			And attach the file "http://assets2.pragprog.com/images/covers/120x144/betas/achbd.jpg?1236205241" to "Cover"
			And select "English" from "Language"
			And press "Create"
		Then I should see "Book was successfully created."
		
	Scenario: Add Book with minimal fields
		When I fill in "Title" with "The Minimal Book"
			And press "Create"
		Then I should see "Book was successfully created."

	Scenario: Fill authors with auto-complete
		When I type "fow" on "Authors"
			Then I should see "Chad Fowler" 
				And should see "Martin Fowler"
		When I click on link "Martin Fowler"
			Then I should see "Martin Fowler" within "Authors"

	Scenario: Fill authors with auto-complete
		When I type "ke" on "Authors"
			Then I should see "Kent Beck" 
		When I click on link "Kent Beck"
			Then I should see "Kent Beck" within "Authors"
		
# TODO How to test flash uploader (FancyUpload)?