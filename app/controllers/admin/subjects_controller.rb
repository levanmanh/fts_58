class Admin::SubjectsController < ApplicationController
  before_action :logged_in_user, :require_admin

  def index
    @subjects = Subject.paginate page: params[:page]
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "controller.subject.create_success"
      redirect_to admin_subjects_path
    else
      flash[:danger] = t "controller.subject.create_error"
      render :new
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name, :number_question, :duration
  end
end
