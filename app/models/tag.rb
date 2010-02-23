class Tag < ActiveRecord::Base
  
  validates_presence_of :name
  
  def Tag.for_lookup
    Tag.find(:all, { :select => :name, :order => :name }).collect { |tag| tag.name }
  end
  
end
