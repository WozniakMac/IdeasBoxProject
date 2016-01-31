class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_box
  before_action :set_idea

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.idea = @idea
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@box, @idea], notice: I18n.t('comment.created') }
      else
        format.html { redirect_to [@box, @idea], notice: "#{I18n.t('field')} " +@comment.errors.full_messages.first }
      end
    end
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private
    def set_box
      @box = Box.friendly.find(params[:box_id])
    end

    def set_idea
      @idea = Idea.find(params[:idea_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
