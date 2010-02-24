require 'spec_helper'

describe Book do
  
  fixtures :authors, :tags, :books, :books_authors, :books_tags
  before(:each) do
    @required_attributes = {
      :title => "Planning Extreme Programming"
    }
  end

  context "in general" do
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
    
    it "should have 0..* tags" do 
      book = Book.new @required_attributes
      book.should be_valid # valid without tags
      book.tags << tags(:agile)
      book.tags.should have(1).record
      book.should be_valid # valid with 1 tag
      book.save!
    end
  end
  
  context "attributes" do
    it "should receive an authors array" do
      @required_attributes[:authors] = [ authors(:kent_beck) ]
      book = Book.new @required_attributes
      book.authors.should have(1).record
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
      book.update_attributes({ :title => "Planning Extreme Programming - Embrace Change", 
        :authors => "Kent Beck, Martin Fowler" })
      book.authors.should have(2).records
      book.title.should == "Planning Extreme Programming - Embrace Change"
      
      book.attributes = { :title => "Planning Extreme Programming", 
        :authors => "Kent Beck, Martin Fowler" } # annother way
      book.authors.should have(2).records
    end

    it "should receive a tags array" do
      @required_attributes[:tags] = [ tags(:agile), tags(:bdd) ]
      book = Book.new @required_attributes
      book.tags.should have(2).record
      book.save!
    end
        
    it "should receive a tags string" do
      @required_attributes[:tags] = "Agile,\n BDD"
      book = Book.new @required_attributes
      book.tags.should have(2).records
      book.tags[1].name.should == "BDD"
      book.save!
    end
    
    it "should avoid tag duplication" do
      book = books(:planning_xp)
      book.update_attributes({ :title => "Planning Extreme Programming - Embrace Change", 
        :tags => "agile, bdd" })
      book.tags.should have(2).records
      
      Tag.find_by_name("agile").should == Tag.find_by_name("Agile") # case sensitive search duplication
    end
  end

end
