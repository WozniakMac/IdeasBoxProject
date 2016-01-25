class BoxesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :create, :new]
  before_action :set_box, only: [ :fresh, :popular, :planned, :completed, :in_progress]
  before_action :set_box_short, only: [ :about, :show, :edit, :update]
  before_action :check_owner, only: [:edit, :update]

  # GET /boxes
  # GET /boxes.json
  def index
    @boxes = Box.all.order(created_at: :desc)
  end

  def show
    @ideas = @box.ideas.limit(4)
  end

  def fresh
    @ideas = @box.ideas.fresh.order(created_at: :desc)
  end

  def popular
    @ideas = @box.ideas.popular
  end

  def planned
    @ideas = @box.ideas.planned.order(:updated_at)
  end

  def in_progress
    @ideas = @box.ideas.in_progress.order(:updated_at)
  end

  def completed
    @ideas = @box.ideas.completed.order(:updated_at)
  end

  # GET /boxes/new
  def new
    @box = Box.new
  end

  # GET /boxes/1/edit
  def edit
  end

  # POST /boxes
  # POST /boxes.json
  def create
    @box = Box.new(box_params)
    @box.user = current_user

    respond_to do |format|
      if @box.save
        format.html { redirect_to @box, notice: I18n.t('box.created') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /boxes/1
  # PATCH/PUT /boxes/1.json
  def update
    respond_to do |format|
      if @box.update(box_params)
        format.html { redirect_to @box, notice: I18n.t('box.updated') }
      else
        format.html { render :edit }
      end
    end
  end

  private
    #Because is difrent scope between method and this parrameter has difrent name
    def set_box
      @box = Box.find(params[:box_id])
    end

    def set_box_short
      @box = Box.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def box_params
      params.require(:box).permit(:name, :description)
    end

    def check_owner
      if !current_user.is_owner?(@box)
        format.html {redirect_to root_path, notice: 'You have not permissions' }
      end
    end

end
