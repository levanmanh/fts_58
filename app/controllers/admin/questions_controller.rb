class Admin::QuestionsController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :load_subjects

  def index
    @questions = Question.paginate page: params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t "controller.create_question_success"
      redirect_to new_admin_question_path
    else
      flash[:danger] = t "controller.error_question"
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit :content, :question_type, :subject_id,
      :state,answers_attributes: [:id, :content, :is_correct, :_destroy]
  end

  def load_subjects
    @subjects = Subject.all
  end
end
