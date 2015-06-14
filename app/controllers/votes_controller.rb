class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params


  def like
    set true
  end

  def dislike
    set false
  end

  def unlike
    if !@vote.nil?
      @vote.destroy
    end
    respond_to do |format|
      format.html { redirect_to [@box,@idea] }
    end
  end

  private

    def set_params
      @idea = Idea.find(params[:idea_id])
      @vote = @idea.votes.where(user_id: current_user.id).first
      @box = Box.find(params[:box_id])
    end

    def set(type)
      if @vote.nil?
        @vote = Vote.new
        @vote.user = current_user
        @vote.idea = @idea
      end
      @vote.rate = type
      @vote.save
      respond_to do |format|
        format.html { redirect_to [@box,@idea] }
      end
    end
end
