class Admin::VotesController < ApplicationController
  before_action :set_admin_vote, only: [:show, :edit, :update, :destroy]

  # GET /admin/votes
  # GET /admin/votes.json
  def index
    @admin_votes = Admin::Vote.all
  end

  # GET /admin/votes/1
  # GET /admin/votes/1.json
  def show
  end

  # GET /admin/votes/new
  def new
    @admin_vote = Admin::Vote.new
  end

  # GET /admin/votes/1/edit
  def edit
  end

  # POST /admin/votes
  # POST /admin/votes.json
  def create
    @admin_vote = Admin::Vote.new(admin_vote_params)

    respond_to do |format|
      if @admin_vote.save
        format.html { redirect_to @admin_vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @admin_vote }
      else
        format.html { render :new }
        format.json { render json: @admin_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/votes/1
  # PATCH/PUT /admin/votes/1.json
  def update
    respond_to do |format|
      if @admin_vote.update(admin_vote_params)
        format.html { redirect_to @admin_vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_vote }
      else
        format.html { render :edit }
        format.json { render json: @admin_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/votes/1
  # DELETE /admin/votes/1.json
  def destroy
    @admin_vote.destroy
    respond_to do |format|
      format.html { redirect_to admin_votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_vote
      @admin_vote = Admin::Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_vote_params
      params[:admin_vote]
    end
end
