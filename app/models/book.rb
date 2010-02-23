class Book < ActiveRecord::Base
  
  validates_presence_of :title
  has_and_belongs_to_many :authors, :join_table => "books_authors"
  has_and_belongs_to_many :tags
  
  def initialize(p_attributes = nil)
    if (p_attributes.nil?)
      super()
    else
      super(p_attributes.except(:authors, :tags))
      process_attributes(p_attributes)
    end
  end
  
  def update_attributes(p_attributes)
    super(p_attributes.except(:authors, :tags))
    process_attributes(p_attributes)
  end

  private 
    def process_attributes(p_attributes)
      unless p_attributes[:authors].nil?
        if p_attributes[:authors].instance_of?(String)
          authors = array_to_string(p_attributes[:authors], "Author")
        else
          authors = p_attributes[:authors]
        end
        update_attribute(:authors, authors)
      end

      unless p_attributes[:tags].nil?
        if p_attributes[:tags].instance_of?(String)
          tags = array_to_string(p_attributes[:tags], "Tag")
        else
          tags = p_attributes[:tags]
        end
        update_attribute(:tags, tags)
      end
    end
    
    def array_to_string(string_array, model_name)
      model_array = []
      string_array.split(",").each do |name|
        eval("model_array << #{model_name}.find_or_create_by_name(name.strip)")
      end
      model_array
    end
    
end
