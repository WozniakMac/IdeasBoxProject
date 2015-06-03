class Manager::VotesController < Manager::BaseController
  before_action :set_manager_vote, only: [:show, :edit, :update, :destroy]

  # GET /manager/votes
  # GET /manager/votes.json
  def index
    @manager_votes = Manager::Vote.all
  end

  # GET /manager/votes/1
  # GET /manager/votes/1.json
  def show
  end

  # GET /manager/votes/new
  def new
    @manager_vote = Manager::Vote.new
  end

  # GET /manager/votes/1/edit
  def edit
  end

  # POST /manager/votes
  # POST /manager/votes.json
  def create
    @manager_vote = Manager::Vote.new(manager_vote_params)

    respond_to do |format|
      if @manager_vote.save
        format.html { redirect_to @manager_vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @manager_vote }
      else
        format.html { render :new }
        format.json { render json: @manager_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/votes/1
  # PATCH/PUT /manager/votes/1.json
  def update
    respond_to do |format|
      if @manager_vote.update(manager_vote_params)
        format.html { redirect_to @manager_vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager_vote }
      else
        format.html { render :edit }
        format.json { render json: @manager_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/votes/1
  # DELETE /manager/votes/1.json
  def destroy
    @manager_vote.destroy
    respond_to do |format|
      format.html { redirect_to manager_votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_vote
      @manager_vote = Manager::Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_vote_params
      params[:manager_vote]
    end
end
