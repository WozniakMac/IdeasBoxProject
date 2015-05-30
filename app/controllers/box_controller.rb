class BoxController < ApplicationController
  before_action :set_box, only: [:show]
  def index
    @box = Box.all
  end

  def show
  end

  private
    def set_box
      @box = Box.find(params[:id])
    end
end
