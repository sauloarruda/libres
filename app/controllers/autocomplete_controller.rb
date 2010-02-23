class AutocompleteController < ApplicationController
  layout nil

  before_filter :set_content_type
  
  def set_content_type
    response.content_type = "text/javascript"
  end
  
  def authors
    @authors = Author.for_lookup
  end
  
end
