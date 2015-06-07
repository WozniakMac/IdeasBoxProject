class Manager::BoxesController < Manager::BaseController
  before_action :set_manager_box, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:show, :edit, :update, :destroy]

  # GET /manager/boxes
  # GET /manager/boxes.json
  def index
    @manager_boxes = current_user.boxes
  end

  # GET /manager/boxes/1
  # GET /manager/boxes/1.json
  def show
    @manager_idea = Idea.new
  end

  # GET /manager/boxes/new
  def new
    @manager_box = Box.new
  end

  # GET /manager/boxes/1/edit
  def edit
  end

  # POST /manager/boxes
  # POST /manager/boxes.json
  def create
    @manager_box = Box.new(manager_box_params)
    @manager_box.user = current_user

    respond_to do |format|
      if @manager_box.save
        format.html { redirect_to [:manager,@manager_box], notice: 'Box created' }
        format.json { render :show, status: :created, location: @manager_box }
      else
        format.html { render :new }
        format.json { render json: @manager_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/boxes/1
  # PATCH/PUT /manager/boxes/1.json
  def update
    respond_to do |format|
      if @manager_box.update(manager_box_params)
        format.html { redirect_to [:manager,@manager_box], notice: 'Box updated' }
        format.json { render :show, status: :ok, location: @manager_box }
      else
        format.html { render :edit }
        format.json { render json: @manager_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/boxes/1
  # DELETE /manager/boxes/1.json
  def destroy
    @manager_box.destroy
    respond_to do |format|
      format.html { redirect_to manager_boxes_url, notice: 'Box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_box
      @manager_box = Box.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_box_params
      params.require(:box).permit(:name, :description)
    end

    def check_owner
      if !current_user.is_owner?(@manager_box)
        format.html {redirect_to root_path, notice: 'You have not permissions' }
      end
    end
end
