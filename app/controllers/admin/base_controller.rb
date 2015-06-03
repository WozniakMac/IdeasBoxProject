class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :check_admin

  private
    def check_admin
      if !current_user.is_admin?
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'You have not permissions' }
          format.json { render json: @admin_box.errors, status: :unprocessable_entity }
        end
      end
    end
end