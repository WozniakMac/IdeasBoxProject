class Manager::IdeasController < Manager::BaseController
  before_action :set_manager_idea
  before_action :set_box
  before_action :check_box_owner

  # GET /manager/ideas/1
  # GET /manager/ideas/1.json
  def show
    @manager_comment = Comment.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_idea
      @manager_idea = Idea.find(params[:id])
    end

    def set_box
      @manager_box = Box.find(params[:box_id])
    end

    def check_box_owner
      if !current_user.is_owner?(@manager_box)
        format.html {redirect_to root_path, notice: 'You have not permissions' }
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_idea_params
      params.require(:idea).permit(:title, :description)
    end
end
