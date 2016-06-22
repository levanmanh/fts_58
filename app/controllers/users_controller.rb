class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :load_user, only: [:show, :update, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "user.create_success"
      redirect_to root_path
    else
      flash[:danger] = t "user.create_error"
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "user.update_success"
      redirect_to @user
    else
      flash[:danger] = t "user.update_error"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
  end
end
