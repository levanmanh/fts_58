class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def require_admin
    flash[:success] = t "shared.isadmin?"
    redirect_to root_path unless current_user.is_admin?
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "layouts.login"
      redirect_to login_url
    end
  end
end
