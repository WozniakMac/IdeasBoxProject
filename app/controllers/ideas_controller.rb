class IdeasController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_box


  def show
    @idea = Idea.find(params[:id])
    @comment = Comment.new
    @vote = Vote.new
    @vote.idea = @idea
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @idea.as_json(user: current_user) }
    end
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    @idea.box = @box
    if @idea.status == nil
      @idea.fresh!
    end

    respond_to do |format|
      if @idea.save
        format.html { redirect_to [@box,@idea], notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  #def update
  #  respond_to do |format|
  #    if @idea.update(idea_params)
  #      format.html { redirect_to [@box,@idea], notice: 'Idea was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @idea }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @idea.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  private
    def set_box
      @box = Box.find(params[:box_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :description)
    end
end
