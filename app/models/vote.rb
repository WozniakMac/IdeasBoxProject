class Vote < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  after_save :update_idea_counters
  after_destroy :update_idea_counters

  def update_idea_counters
    idea = self.idea
    idea.like_counter = idea.votes.where(rate: true).count
    idea.dislike_counter = idea.votes.where(rate: false).count
    idea.save
  end
end
