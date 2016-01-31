class AddColumncToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :slug, :string
    add_index :boxes, :slug, unique: true
  end
end
