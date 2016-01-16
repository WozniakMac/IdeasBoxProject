class BoxesController < ApplicationController
  before_action :set_box, only: [ :fresh, :popular, :planned, :completed, :in_progress, :about]

  # GET /boxes
  # GET /boxes.json
  def index
    @boxes = Box.all.order(created_at: :desc)
  end

  def show
    @box = Box.find(params[:id])
    @ideas = @box.ideas.limit(4)
  end

  def fresh
    @ideas = @box.ideas.fresh.order(created_at: :desc)
  end

  def popular
    @ideas = @box.ideas.popular
  end

  def planned
    @ideas = @box.ideas.planned.order(:updated_at)
  end

  def in_progress
    @ideas = @box.ideas.in_progress.order(:updated_at)
  end

  def completed
    @ideas = @box.ideas.completed.order(:updated_at)
  end

  private
    #Because is difrent scope between method and this parrameter has difrent name
    def set_box
      @box = Box.find(params[:box_id])
    end

end
