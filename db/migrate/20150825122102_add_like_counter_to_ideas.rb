class AddLikeCounterToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :like_counter, :integer, :default => 0, :null => false
  end
end
