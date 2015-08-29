class BoxesController < ApplicationController
  before_action :set_box, only: [ :fresh, :popular, :planned, :completed, :in_progress, :about]

  # GET /boxes
  # GET /boxes.json
  def index
    @boxes = Box.all.order(created_at: :desc).limit(10)
    @boxes_top = Box.top10
  end

  def show
    @box = Box.find(params[:id])
    @idea = Idea.new
  end

  def about
    render json: @box.as_json(:description)
  end

  def fresh
    render json: @box.ideas.fresh.as_json(user: current_user)
  end

  def popular
    render json: @box.ideas.fresh.order('dislike_counter - like_counter').as_json(user: current_user)
  end

  def planned
    render json: @box.ideas.planned.order(:updated_at).as_json(user: current_user)
  end

  def in_progress
    render json: @box.ideas.in_progress.order(:updated_at).as_json(user: current_user)
  end

  def completed
    render json: @box.ideas.completed.order(:updated_at).as_json(user: current_user)
  end

  private
    #Because is difrent scope between method and this parrameter has difrent name
    def set_box
      @box = Box.find(params[:box_id])
    end

end
