class AddStatusToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :status, :integer
    add_index :ideas, :status
  end
end
