class LessonsController < ApplicationController

  def index
    @lesson = Lesson.new
    @lessons = current_user.lessons.order "created_at DESC"
    @subjects = Subject.all
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
    params.require(:lesson).permit :subject_id, :status, :point
  end
end
