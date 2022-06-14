class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def not_authenticated
    redirect_to admin_login_path, warning: 'Please login first.'
  end

  def check_admin
    redirect_to posts_path, warning: 'Not authorized' unless current_user.admin?
  end
end
