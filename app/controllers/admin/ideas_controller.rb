class Admin::IdeasController < ApplicationController
  before_action :set_admin_idea, only: [:show, :edit, :update, :destroy]

  # GET /admin/ideas
  # GET /admin/ideas.json
  def index
    @admin_ideas = Admin::Idea.all
  end

  # GET /admin/ideas/1
  # GET /admin/ideas/1.json
  def show
  end

  # GET /admin/ideas/new
  def new
    @admin_idea = Admin::Idea.new
  end

  # GET /admin/ideas/1/edit
  def edit
  end

  # POST /admin/ideas
  # POST /admin/ideas.json
  def create
    @admin_idea = Admin::Idea.new(admin_idea_params)

    respond_to do |format|
      if @admin_idea.save
        format.html { redirect_to @admin_idea, notice: 'Idea was successfully created.' }
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
        format.html { redirect_to @admin_idea, notice: 'Idea was successfully updated.' }
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
      format.html { redirect_to admin_ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_idea
      @admin_idea = Admin::Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_idea_params
      params[:admin_idea]
    end
end
