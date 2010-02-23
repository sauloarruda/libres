class Book < ActiveRecord::Base
  
  validates_presence_of :title
  has_and_belongs_to_many :authors, :join_table => "books_authors"
  has_and_belongs_to_many :tags
  
  def attributes=(attributes)
    super(attributes.except(:authors, :tags))
    process_attributes(attributes)
  end

  private 
  
    # process authors and tag attributes for allow use of strings and arrays
    def process_attributes(attributes)
      convert_attribute(attributes, :authors, "Author")
      convert_attribute(attributes, :tags, "Tag")
    end
    
    # convert attribute value and call ActiveRecord::Base#update_attribute method
    def convert_attribute(attributes, attribute_name, model_class)
      unless attributes[attribute_name].nil?
        if attributes[attribute_name].instance_of?(String)
          value = array_to_string(attributes[attribute_name], model_class)
        else
          value = attributes[attribute_name]
        end
        update_attribute(attribute_name, value)
      end
    end
    
    # convert string elements split by ',' to objects (create if needed)
    def array_to_string(string_array, model_name)
      model_array = []
      string_array.split(",").each do |name|
        eval("model_array << #{model_name}.find_or_create_by_name(name.strip)")
      end
      model_array
    end
    
end
