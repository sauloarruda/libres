require 'spec_helper'

describe BooksController do

  integrate_views

  context "New Book controller" do
    it "should create new book object" do
      get 'new'
      assigns[:book].should_not be_nil
      response.should render_template("books/new.html.erb")
      response.should have_tag("h1", /New Book/)
    end
  end
  
  context "Create Book controller" do
    it "should render error messages" do
      post 'create', :book => { :title => "", :authors => "" }
      assigns[:book].should_not be_valid
      response.should render_template("books/new.html.erb")
      response.should have_tag("li", /Title can't be blank/)
    end
    
    it "should create with valid attributes" do
      post 'create', :book => { :title => "Pomodoro Technique Illustrated", :authors => "Staffan Nöteberg" }
      response.should redirect_to("/books/" + assigns[:book].id.to_s)
      flash[:notice].should == "Book was successfully created."
      Book.find_by_title("Pomodoro Technique Illustrated").should_not be_nil
      Author.find_by_name("Staffan Nöteberg").should_not be_nil
    end
  end

end
