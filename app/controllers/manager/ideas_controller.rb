class Manager::IdeasController < Manager::BaseController
  before_action :set_manager_idea, only: [:show, :edit, :update]
  before_action :set_box , only: [:create, :show, :edit, :update]
  before_action :check_box_owner, only: [:show, :new, :edit, :update]

  # GET /manager/ideas/1
  # GET /manager/ideas/1.json
  def show
    @manager_comment = Comment.new
  end

  # GET /manager/ideas/1/edit
  def edit
  end

  # POST /manager/ideas
  # POST /manager/ideas.json
  def create
    @manager_idea = Idea.new(manager_idea_params)
    @manager_idea.user = current_user
    @manager_idea.box = @manager_box

    respond_to do |format|
      if @manager_idea.save
        format.html { redirect_to [:manager,@manager_box,@manager_idea], notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @manager_idea }
      else
        format.html { render :new }
        format.json { render json: @manager_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/ideas/1
  # PATCH/PUT /manager/ideas/1.json
  def update
    respond_to do |format|
      if @manager_idea.update(manager_idea_params)
        format.html { redirect_to [:manager,@manager_box,@manager_idea], notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager_idea }
      else
        format.html { render :edit }
        format.json { render json: @manager_idea.errors, status: :unprocessable_entity }
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
end
