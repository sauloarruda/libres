require 'spec_helper'
include BooksHelper

describe BooksHelper do
  fixtures :authors, :tags

  it "should define authors_for_lookup method" do
    authors_for_lookup.should == "[\"Kent Beck\",\"Martin Fowler\"]"
  end

  it "should define tags_for_lookup method" do
    tags_for_lookup.should == "[\"Agile\",\"BDD\",\"Scrum\"]"
  end

end
