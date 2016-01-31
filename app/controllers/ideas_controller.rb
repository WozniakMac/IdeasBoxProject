class IdeasController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :edit, :new]
  before_action :set_box
  before_action :set_idea, only: [:show, :edit, :update]
  before_action :check_owner, only: [:edit, :update]


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
        format.html { redirect_to [@box,@idea], notice: I18n.t('idea.created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @idea.created_at < 5.minute.ago
        format.html { redirect_to [@box,@idea], notice: I18n.t('idea.canedit') }
      elsif @idea.update(idea_params)
        format.html { redirect_to [@box,@idea], notice: I18n.t('idea.updated') }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_box
      @box = Box.friendly.find(params[:box_id])
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :description)
    end

    def check_owner
      if !current_user.is_owner?(@idea)
        format.html {redirect_to root_path, notice: I18n.t('permissions.denied') }
      end
    end
end
