module IdeasHelper
  def idea_button_class(idea, status)
    if liked?(idea) and status == :liked
      return "ids-active"
    elsif disliked?(idea) and status == :disliked
      return "ids-active"
    end
    return ""
  end

  def liked?(idea)
    idea.votes.where(rate: true).where(user: current_user).count > 0
  end

  def disliked?(idea)
    idea.votes.where(rate: false).where(user: current_user).count > 0
  end
end
