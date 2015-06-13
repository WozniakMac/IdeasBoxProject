class Admin::CommentsController < Admin::BaseController
  before_action :set_admin_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_admin_box
  before_action :set_admin_idea

  # GET /admin/comments/1/edit
  def edit
  end

  # POST /admin/comments
  # POST /admin/comments.json
  def create
    @admin_comment = Comment.new(admin_comment_params)
    @admin_comment.idea = @admin_idea
    @admin_comment.user = current_user

    respond_to do |format|
      if @admin_comment.save
        format.html { redirect_to [:admin, @admin_box, @admin_idea], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @admin_comment }
      else
        format.html { render :new }
        format.json { render json: @admin_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/comments/1
  # PATCH/PUT /admin/comments/1.json
  def update
    respond_to do |format|
      if @admin_comment.update(admin_comment_params)
        format.html { redirect_to [:admin, @admin_box, @admin_idea], notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_comment }
      else
        format.html { render :edit }
        format.json { render json: @admin_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/comments/1
  # DELETE /admin/comments/1.json
  def destroy
    @admin_comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_comment
      @admin_comment = Comment.find(params[:id])
    end

    def set_admin_box
      @admin_box = Box.find(params[:box_id])
    end

    def set_admin_idea
      @admin_idea = Idea.find(params[:idea_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_comment_params
      params.require(:comment).permit(:comment)
    end
end
