class Manager::CommentsController < Manager::BaseController
  before_action :set_manager_box
  before_action :set_manager_idea
  before_action :check_box_owner

  def create
    @manager_comment = Comment.new(manager_comment_params)
    @manager_comment.idea = @manager_idea
    @manager_comment.user = current_user

    respond_to do |format|
      if @manager_comment.save
        format.html { redirect_to [:manager, @manager_box, @manager_idea], notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_manager_box
      @manager_box = Box.find(params[:box_id])
    end

    def set_manager_idea
      @manager_idea = Idea.find(params[:idea_id])
    end

    def check_box_owner
      if !current_user.is_owner?(@manager_box)
        format.html {redirect_to root_path, notice: 'You have not permissions' }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_comment_params
      params.require(:comment).permit(:comment)
    end
end
