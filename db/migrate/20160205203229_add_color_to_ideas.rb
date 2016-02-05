class AddColorToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :color, :integer
  end
end
