require 'spec_helper'

describe Author do
  
  fixtures :authors
  before(:each) do
    @valid_attributes = {
      
    }
  end

  context "An Author (in general)" do
    it "should create a new instance given valid attributes" do
      Author.create!(@valid_attributes)
    end
    
    it "should capitalize author name" do
      Author.create!(:name => "ROBERT C. MARTIN").name.should == "Robert C. Martin"
      Author.create!(:name => "ron jeffries").name.should == "Ron Jeffries"
      Author.create!(:name => "mIkE cOhN").name.should == "Mike Cohn"
      Author.new(:name => nil).name.should be_nil
    end
  end
  
  it "should define a lookup method" do
    authors = Author.for_lookup
    authors.should have(2).records
    authors[0].should == "Kent Beck"
  end
  
end
