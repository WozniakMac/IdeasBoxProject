class Admin::BoxesController < ApplicationController
  before_action :set_admin_box, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_admin

  # GET /admin/boxes
  # GET /admin/boxes.json
  def index
    @admin_boxes = Box.all
  end

  # GET /admin/boxes/1
  # GET /admin/boxes/1.json
  def show
  end

  # GET /admin/boxes/new
  def new
    @admin_box = Box.new
  end

  # GET /admin/boxes/1/edit
  def edit
  end

  # POST /admin/boxes
  # POST /admin/boxes.json
  def create
    @admin_box = Box.new(admin_box_params)
    @admin_box.user = current_user

    respond_to do |format|
      if @admin_box.save
        format.html { redirect_to [:admin,@admin_box], notice: 'Box was successfully created.' }
        format.json { render :show, status: :created, location: @admin_box }
      else
        format.html { render :new }
        format.json { render json: @admin_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/boxes/1
  # PATCH/PUT /admin/boxes/1.json
  def update
    respond_to do |format|
      if @admin_box.update(admin_box_params)
        format.html { redirect_to [:admin,@admin_box], notice: 'Box was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_box }
      else
        format.html { render :edit }
        format.json { render json: @admin_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/boxes/1
  # DELETE /admin/boxes/1.json
  def destroy
    @admin_box.destroy
    respond_to do |format|
      format.html { redirect_to admin_boxes_url, notice: 'Box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_box
      @admin_box = Box.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_box_params
      params.require(:box).permit(:name, :description)
    end

    def check_admin
      if !current_user.is_admin?
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'You have not permissions' }
          format.json { render json: @admin_box.errors, status: :unprocessable_entity }
        end
      end
    end
end
