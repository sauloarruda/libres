module BooksHelper
  
  def authors_for_lookup
    Author.for_lookup.to_json
  end
  
  def tags_for_lookup
    Tag.for_lookup.to_json
  end
  
end
