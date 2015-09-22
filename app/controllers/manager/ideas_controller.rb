class Manager::IdeasController < Manager::BaseController
  before_action :set_manager_idea
  before_action :set_box
  before_action :check_box_owner

  # GET /manager/ideas/1
  # GET /manager/ideas/1.json
  def show
    @manager_comment = Comment.new
  end

  #Idea.statuses.each do |name, value|
  #  define_method name do
  #    @manager_idea.send(name+'!')
  #    respond_to do |format|
  #      if @manager_idea.save
  #        format.html { redirect_to [:manager, @manager_box, @manager_idea], notice: "Idea was successfully setted as #{name.humanize} :)" }
  #        format.json { render :show, status: :created, location: @manager_comment }
  #      else
  #        format.html { render :new }
  #        format.json { render json: @manager_idea.errors, status: :unprocessable_entity }
  #      end
  #    end
  #  end
  #end

  def update
    respond_to do |format|
      if @manager_idea.update(manager_idea_status)
        format.html { redirect_to [:manager,@manager_box,@manager_idea], notice: 'Idea was successfully updated.' }
      else
        format.html { redirect_to [:manager,@manager_box,@manager_idea], notice: 'Something goes wrong.' }
      end
    end
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

    def manager_idea_status
      params.require(:idea).permit(:status)
    end
end
