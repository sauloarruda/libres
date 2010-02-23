require 'spec_helper'

describe AutocompleteController do
  integrate_views
  fixtures :authors

  context "Auto-complete authors" do
    it "should define authors array" do
      post 'authors'
      assigns[:authors].should have(2).records
      response.content_type.should == "text/javascript"
      response.should have_text("var authors = Array(2)\nauthors[0] = \"Kent Beck\"\nauthors[1] = \"Martin Fowler\"\n")
    end
  end 

end
