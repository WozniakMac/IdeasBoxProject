class Manager::CommentsController < Manager::BaseController
  before_action :set_manager_comment, only: [:show, :edit, :update, :destroy]

  # GET /manager/comments
  # GET /manager/comments.json
  def index
    @manager_comments = Manager::Comment.all
  end

  # GET /manager/comments/1
  # GET /manager/comments/1.json
  def show
  end

  # GET /manager/comments/new
  def new
    @manager_comment = Manager::Comment.new
  end

  # GET /manager/comments/1/edit
  def edit
  end

  # POST /manager/comments
  # POST /manager/comments.json
  def create
    @manager_comment = Manager::Comment.new(manager_comment_params)

    respond_to do |format|
      if @manager_comment.save
        format.html { redirect_to @manager_comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @manager_comment }
      else
        format.html { render :new }
        format.json { render json: @manager_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/comments/1
  # PATCH/PUT /manager/comments/1.json
  def update
    respond_to do |format|
      if @manager_comment.update(manager_comment_params)
        format.html { redirect_to @manager_comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager_comment }
      else
        format.html { render :edit }
        format.json { render json: @manager_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/comments/1
  # DELETE /manager/comments/1.json
  def destroy
    @manager_comment.destroy
    respond_to do |format|
      format.html { redirect_to manager_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_comment
      @manager_comment = Manager::Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_comment_params
      params[:manager_comment]
    end
end
