require 'spec_helper'

describe AutocompleteController do
  integrate_views
  fixtures :authors, :tags

  context "Auto-complete authors" do
    it "should define authors array" do
      post 'authors'
      assigns[:authors].should have(2).records
      response.content_type.should == "text/javascript"
      response.should have_text("var authors = Array(2)\nauthors[0] = \"Kent Beck\"\nauthors[1] = \"Martin Fowler\"\n")
    end
  end 
  
  context "Auto-complete tags" do
    it "should define tags array" do
      post 'tags'
      assigns[:tags].should have(3).records
      response.content_type.should == "text/javascript"
      response.should have_text("var tags = Array(3)\ntags[0] = \"Agile\"\ntags[1] = \"BDD\"\ntags[2] = \"Scrum\"\n")
    end
  end

end
