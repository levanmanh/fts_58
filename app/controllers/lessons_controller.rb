class LessonsController < ApplicationController
  before_action :logged_in_user
  before_action :load_subjects, only: [:index, :create]
  before_action :load_lesson, only: [:show]

  def index
    @lesson = Lesson.new
    @lessons = current_user.lessons
  end

  def create
    @lesson = Lesson.new lesson_params
    @lesson.user_id = current_user.id
    if @lesson.save
      flash[:success] = t "controller.lesson.create_success"
    else
      flash[:danger] = t "controller.lesson.create_error"
    end
    redirect_to lessons_path
  end

  private
  def lesson_params
    params.require(:lesson).permit :subject_id
  end

  def load_subjects
    @subjects = Subject.all
  end

  def load_lesson
    @lesson = Lesson.find_by id: params[:id]
  end
end
