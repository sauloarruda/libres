require 'spec_helper'

describe BooksController do

  integrate_views

  context "Adding book controller" do
    it "should create new book object" do
      get 'new'
      assigns[:book].should_not be_nil
      response.should render_template("books/new.html.erb")
      response.should have_tag("h1", /New Book/)
    end
  end

end
