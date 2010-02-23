class Author < ActiveRecord::Base

  def Author.for_lookup
    Author.find(:all, { :select => :name, :order => :name }).collect { |author| author.name }
  end
  
  def name=(name)
    write_attribute(:name, name.downcase.titleize) unless name.nil?
  end

end
