class IdeasController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  before_action :set_box
  before_action :set_idea, only: [:show, :edit, :update]


  def show
    @comment = Comment.new
    @vote = @idea.votes.new
    respond_to do |format|
      format.html { render :show }
    end
  end

  def new
    @idea = Idea.new
  end

  def edit
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    @idea.box = @box
    if @idea.status == nil
      @idea.status = :fresh
    end

    respond_to do |format|
      if @idea.save
        format.html { redirect_to [@box,@idea], notice: 'Idea was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @idea.created_at < 5.minute.ago
        format.html { redirect_to [@box,@idea], notice: 'Masz tylko 5 minut na edycje' }
      elsif @idea.update(idea_params)
        format.html { redirect_to [@box,@idea], notice: 'Idea was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_box
      @box = Box.find(params[:box_id])
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :description)
    end
end
