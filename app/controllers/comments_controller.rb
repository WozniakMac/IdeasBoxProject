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
        format.html { redirect_to [@box, @idea], notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_box
      @box = Box.find(params[:box_id])
    end

    def set_idea
      @idea = Idea.find(params[:idea_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
