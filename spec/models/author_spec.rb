require 'spec_helper'

describe Author do
  
  fixtures :authors
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Author.create!(@valid_attributes)
  end
  
  it "should define a lookup method" do
    authors = Author.for_lookup
    authors.should have(2).records
    authors[0].should == "Kent Beck"
  end
  
end
