class LessonsController < ApplicationController
  before_action :logged_in_user
  before_action :load_subjects, only: [:index, :create, :show]
  before_action :load_lesson, only: [:show, :update]
  before_action :load_result, only: :show

  def index
    @lesson = Lesson.new
    @lessons = current_user.lessons
  end

  def show
    @lesson.change_status_lesson
  end

  def create
    @lesson = Lesson.new lesson_params
    @lesson.user_id = current_user.id
    if @lesson.save
      flash[:success] = t "controller.lesson.create_success"
      redirect_to lessons_path
    else
      flash[:danger] = t "controller.lesson.create_error"
      render :index
    end
  end

  def update
    @lesson.status = :unchecked if params[:commit] == Settings.finish
    if @lesson.update_attributes lesson_params
      flash[:success] = t "controller.lesson.update_success"
    else
      flash[:danger] =  t "controller.lesson.update_error"
    end
    redirect_to lessons_path
  end

  private
  def lesson_params
    params.require(:lesson).permit :subject_id,
      results_attributes: [:id, :answer_id]
  end

  def load_subjects
    @subjects = Subject.all
  end

  def load_lesson
    @lesson = Lesson.find params[:id]
  end

  def load_result
    @result = Result.find_by params[:id]
  end
end
