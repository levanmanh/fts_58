class LessonsController < ApplicationController
  before_action :load_subjects, only: [:index, :show, :create]
  before_action :load_lesson, only: [:show, :update]

  def index
    @lesson = Lesson.new
    @lessons = current_user.lessons
  end

  def show
    @result = Result.find_by params[:id]
  end

  def create
    @lesson = Lesson.new lesson_params
    @lesson.user_id = current_user.id
    if @lesson.save
      flash[:success] = t "views.lesson.create_success"
      redirect_to lessons_path
    else
      flash[:success] = t "views.lesson.create_error"
      render :new
    end
  end

  private
  def load_subjects
    @subjects = Subject.all
  end

  def load_lesson
    @lesson = Lesson.find params[:id]
  end

  def lesson_params
    params.require(:lesson).permit :subject_id,
      results_attributes: [:id, :answer, answer: []]
  end
end
