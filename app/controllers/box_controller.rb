class BoxController < ApplicationController
  before_action :set_box, only: [:show, :edit, :update]
  def index
    @box = Box.all
  end

  def show
  end

  def create
    @box = Box.new(box_params)
    respond_to do |format|
      if @box.save
        format.html { redirect_to @box, notice: 'Box was successfully created.' }
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
        format.html {redirect_to @box, notice: 'Box was successfully updated.'}
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
      params.require(:box).permit(:name, :description, :user_id)
    end
end
