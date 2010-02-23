class CreateBooksAuthors < ActiveRecord::Migration
  def self.up
    create_table :books_authors, :id => false do |t|
      t.references :book, :null => false
      t.references :author, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :books_authors
  end
end
