class BoxController < ApplicationController
  before_action :set_box, only: [:show, :edit, :update]
  before_action :authenticate_user!
  before_action :check_owner, only: [:edit, :update]
  def index
    @box = current_user.boxes.all
  end

  def show
  end

  def create
    @box = Box.new(box_params)
    @box.user = current_user
    respond_to do |format|
      if @box.save
        format.html { redirect_to @box, notice: I18n.t 'box.created' }
      else
        format.html { render :new }
      end
    end
  end

  def new
    @box = Box.new
  end

  def update
    respond_to do |format|
      if @box.update(box_params)
        format.html {redirect_to @box, notice: I18n.t 'box.updated' }
      else
        format.html {render :edit}
      end
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_box
      @box = Box.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def box_params
      params.require(:box).permit(:name, :description)
    end

    def check_owner
      unless current_user.is_owner?(@box) or current_user.is_admin?
        format.html {redirect_to root_path, notice: I18n.t 'permissions.denied' }
    end
end
