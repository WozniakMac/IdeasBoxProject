class TableController < ApplicationController
  def ideas
    @liked_ideas = Idea.joins(:votes).where('votes.user': current_user).where('votes.rate': true)
    @user_ideas = Idea.where(user: current_user)
  end

  def boxes
    @user_boxes = Box.where(user: current_user)
  end
end
