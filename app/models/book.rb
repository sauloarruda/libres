class Book < ActiveRecord::Base
  
  validates_presence_of :title
  has_and_belongs_to_many :authors, :join_table => "books_authors"
  
  def initialize(attributes = nil)
    if (attributes.nil?)
      super()
    else
      super(attributes.except(:authors))
      process_attributes(attributes)
    end
  end
  
  def update_attributes(attributes = nil)
    process_attributes(attributes)
  end
  
  private 
    def process_attributes(attributes)
      unless attributes[:authors].nil?
        if not attributes.nil? and  attributes[:authors].instance_of?(String)
          self.authors.clear
          attributes[:authors].split(",").each do |author_name|
            self.authors << Author.find_or_create_by_name(author_name.strip)
          end
        else
          self.authors = attributes[:authors]
        end
      end
    end
  
end
