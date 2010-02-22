class AlterAuthorAddName < ActiveRecord::Migration
  def self.up
    add_column :authors, :name, :string
  end

  def self.down
    remove_column :authors, :name
  end
end
