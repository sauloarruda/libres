class Book < ActiveRecord::Base
  
  validates_presence_of :title
  has_and_belongs_to_many :authors, :join_table => "books_authors", :order => "authors.name"
  has_and_belongs_to_many :tags, :order => "tags.name"
  attr_accessor :authors_s, :tags_s
  before_save :process_attributes
  
  # lookup authors_s and tags_s
  def after_find
    self.authors_s = self.authors.collect { |author| author.name }.join(", ")
    self.tags_s = self.tags.collect { |tag| tag.name }.join(", ")
  end
  
  private 

    # process authors and tag attributes for allow use of strings and arrays
    def process_attributes
      self.authors = array_to_string(self.authors_s, "Author") unless self.authors_s.nil?
      self.tags = array_to_string(self.tags_s, "Tag") unless self.tags_s.nil?
    end
    
    # convert string elements split by ',' to objects (create if needed)
    def array_to_string(string_array, model_name)
      model_array = []
      model_object = Object.const_get(model_name)
      string_array.split(",").each do |name|
        model_array << model_object.find_or_create_by_name(name.strip)
      end
      model_array
    end
    
end
