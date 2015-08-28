class CalculateCounterOnIdeas < ActiveRecord::Migration
  def change
    Vote.all.each do |v|
      v.update_idea_counters
    end
  end
end
