class Admin::UsersController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :find_user, only: [:destroy]

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user.destroy_success"
    else
      flash[:danger] = t "user.destroy_error"
    end
    redirect_to admin_users_path
  end

  def find_user
    @user = User.find_by id: params[:id] 
  end
end
