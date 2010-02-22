require 'spec_helper'

describe Book do
  
  fixtures :authors, :books, :books_authors
  before(:each) do
    @required_attributes = {
      :title => "Planning Extreme Programming"
    }
  end

  context "A Book (in general)" do
    it "should be valid with required attributes" do
      book = Book.new
      book.should_not be_valid
      book.should have(1).error_on(:title)
      book.attributes = @required_attributes
      book.should be_valid
      book.save!
    end
    
    it "should have 0..* authors" do
      book = Book.new @required_attributes
      book.should be_valid # valid without authors
      book.authors << authors(:kent_beck)
      book.authors.should have(1).record
      book.should be_valid # valid with 1 author
      book.save!
    end
  end
  
  context "The Book Constructor" do
    it "should receive an authors array" do
      @required_attributes[:authors] = [ authors(:kent_beck) ]
      book = Book.new @required_attributes
      book.should be_valid
      book.save!
    end
    
    it "should receive an authors string" do
      @required_attributes[:authors] = "Kent Beck,\n Martin Fowler "
      book = Book.new @required_attributes
      book.should be_valid
      book.authors.should have(2).records
      book.authors[1].name.should == "Martin Fowler"
      book.save!
    end
    
    it "should avoid author duplications when update" do
      book = books(:planning_xp)
      book.update_attributes({ :title => "Planning Extreme Programming", :authors => "Kent Beck, Martin Fowler" })
      book.save!
      book.authors.should have(2).records
    end
  end

end
