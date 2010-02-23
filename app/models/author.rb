class Author < ActiveRecord::Base

  def Author.for_lookup
    Author.find(:all, { :select => :name, :order => :name }).collect { |author| author.name }
  end

end
