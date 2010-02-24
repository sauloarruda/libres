class Author < ActiveRecord::Base

  def Author.for_lookup
    authors = Author.find(:all, { :select => :name, :order => :name }) # create local variable for better performance
    authors.collect { |author| author.name }
  end
  
  def name=(name)
    write_attribute(:name, name.downcase.titleize) unless name.nil?
  end

end
