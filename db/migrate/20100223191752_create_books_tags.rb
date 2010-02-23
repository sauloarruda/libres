class CreateBooksTags < ActiveRecord::Migration
  def self.up
    create_table :books_tags, :id => false do |t|
      t.references :book, :null => false
      t.references :tag, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :books_authors
  end
end
