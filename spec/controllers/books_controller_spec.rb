require 'spec_helper'

describe BooksController do

  integrate_views

  context "New Book" do
    it "should create new book object" do
      get 'new'
      assigns[:book].should_not be_nil
      response.should render_template("books/new.html.erb")
      response.should have_tag("h1", /New Book/)
      response.should have_tag("input[type=?][name=?]", 'text', 'book[title]')
    end
    
    it "should have authors auto-complete" do
      get 'new'
      response.should have_tag("input[type=?][id=?][name=?]", 'text', 'book_authors', 'book[authors]')
      response.should have_tag("form", /new Autocompleter.Local\('book_authors', 'author_lookup_auto_complete', \[\"Kent Beck\",\"Martin Fowler\"\], \{ tokens: ',' \}\);/)
    end
    
    it "should have tags auto-complete" do
      get 'new'
      response.should have_tag("input[type=?][id=?][name=?]", 'text', 'book_tags', 'book[tags]')
      response.should have_tag("body", /new Autocompleter.Local\('book_tags', 'tags_lookup_auto_complete', \[\"Agile\",\"BDD\",\"Scrum\"\], \{ tokens: ',' \}\);/)
    end
  end
  
  context "Create Book controller" do
    it "should render error messages" do
      post 'create', :book => { :title => "", :authors => "", :tags => "" }
      assigns[:book].should_not be_valid
      response.should render_template("books/new.html.erb")
      response.should have_tag("li", /Title can't be blank/)
    end
    
    it "should create with valid attributes" do
      post 'create', :book => { :title => "Pomodoro Technique Illustrated", :authors => "Staffan Nöteberg",
        :tags => "Agile, Pomodoro, The Pragmatic Bookshelf" }
      response.should redirect_to("/books/" + assigns[:book].id.to_s)
      flash[:notice].should == "Book was successfully created."
      Book.find_by_title("Pomodoro Technique Illustrated").should_not be_nil
      Author.find_by_name("Staffan Nöteberg").should_not be_nil
    end
  end

end
