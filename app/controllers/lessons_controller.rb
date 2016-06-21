class LessonsController < ApplicationController
  before_action :logged_in_user
  before_action :load_subjects, only: [:index, :create]

  def index
    @lesson = Lesson.new
    @lessons = current_user.lessons
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

  private
  def lesson_params
    params.require(:lesson).permit :subject_id,
      results_attributes: [:id, :answer_id]
  end

  def load_subjects
    @subjects = Subject.all
  end
end
