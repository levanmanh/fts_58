class Admin::UsersController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :find_user, only: [:destroy, :show]

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user.destroy_success"
      redirect_to admin_users_path
    end
  end

  private
  def find_user
    @user = User.find params[:id] 
  end
end
