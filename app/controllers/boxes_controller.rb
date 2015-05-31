class BoxesController < ApplicationController
  before_action :set_box, only: [:show]

  # GET /boxes
  # GET /boxes.json
  def index
    @boxes = Box.all
  end

  # GET /boxes/1
  # GET /boxes/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_box
      @box = Box.find(params[:id])
    end
end
