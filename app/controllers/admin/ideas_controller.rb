class Admin::IdeasController < Admin::BaseController
  before_action :set_admin_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_box , only: [:create, :show, :edit, :update, :destroy]

  # GET /admin/ideas/1
  # GET /admin/ideas/1.json
  def show
  end

  # GET /admin/ideas/1/edit
  def edit
  end

  # POST /admin/ideas
  # POST /admin/ideas.json
  def create
    @admin_idea = Idea.new(admin_idea_params)
    @admin_idea.user = current_user
    @admin_idea.box = @admin_box

    respond_to do |format|
      if @admin_idea.save
        format.html { redirect_to [:admin,@admin_box,@admin_idea], notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @admin_idea }
      else
        format.html { render :new }
        format.json { render json: @admin_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/ideas/1
  # PATCH/PUT /admin/ideas/1.json
  def update
    respond_to do |format|
      if @admin_idea.update(admin_idea_params)
        format.html { redirect_to [:admin,@admin_box,@admin_idea], notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_idea }
      else
        format.html { render :edit }
        format.json { render json: @admin_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/ideas/1
  # DELETE /admin/ideas/1.json
  def destroy
    @admin_idea.destroy
    respond_to do |format|
      format.html { redirect_to @admin_box, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_idea
      @admin_idea = Idea.find(params[:id])
    end

    def set_box
      @admin_box = Box.find(params[:box_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_idea_params
      params.require(:idea).permit(:title, :description)
    end
end
