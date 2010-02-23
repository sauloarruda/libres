require 'spec_helper'

describe Tag do
  
  fixtures :tags
  before(:each) do
    @valid_attributes = {
      :name => "agile"
    }
  end

  context "in general" do
    it "should create a new instance given valid attributes" do
      tag = Tag.new @valid_attributes
      tag.should be_valid
      tag.save!
    end
    
    it "should be invalid without required attributes" do
      tag = Tag.new
      tag.should_not be_valid
      tag.should have(1).error_on(:name) 
    end
  end
  
  it "should define a lookup method" do
    tags = Tag.for_lookup
    tags.should have(3).records
    tags[0].should == "Agile"
  end
  
end
