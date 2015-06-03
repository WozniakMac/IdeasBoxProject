class Manager::IdeasController < Manager::BaseController
  before_action :set_manager_idea, only: [:show, :edit, :update, :destroy]

  # GET /manager/ideas
  # GET /manager/ideas.json
  def index
    @manager_ideas = Manager::Idea.all
  end

  # GET /manager/ideas/1
  # GET /manager/ideas/1.json
  def show
  end

  # GET /manager/ideas/new
  def new
    @manager_idea = Manager::Idea.new
  end

  # GET /manager/ideas/1/edit
  def edit
  end

  # POST /manager/ideas
  # POST /manager/ideas.json
  def create
    @manager_idea = Manager::Idea.new(manager_idea_params)

    respond_to do |format|
      if @manager_idea.save
        format.html { redirect_to @manager_idea, notice: 'Idea was successfully created.' }
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
        format.html { redirect_to @manager_idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager_idea }
      else
        format.html { render :edit }
        format.json { render json: @manager_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/ideas/1
  # DELETE /manager/ideas/1.json
  def destroy
    @manager_idea.destroy
    respond_to do |format|
      format.html { redirect_to manager_ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_idea
      @manager_idea = Manager::Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_idea_params
      params[:manager_idea]
    end
end
