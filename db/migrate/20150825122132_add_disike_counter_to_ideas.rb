class AddDisikeCounterToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :dislike_counter, :integer, :default => 0, :null => false
  end
end
