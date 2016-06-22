class Admin::SubjectsController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :load_subjects, except: [:new, :index, :create]
  before_action :load_lesson, only: :show


  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def show
    @lessons = @subject.lessons
  end

  def edit
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

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "controller.subject.update_success"
      redirect_to admin_subjects_path
    else
      flash[:danger] = t "controller.subject.update_error"
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t "controller.subject.destroy_success"
      redirect_to admin_subjects_path
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name, :number_question, :duration
  end

  def load_lesson
    @subject = Subject.find_by id: params[:id]
  end

  def load_subjects
    @subject = Subject.find params[:id]
  end
end
