class Admin::QuestionsController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :load_subjects, except: [:index]
  before_action :load_question, except: [:new, :create]

  def index
    @questions = Question.paginate(page: params[:page])
  end

  def new
    @question = Question.new
  end

  def show
  end

  def edit
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t "controller.question.create_success"
      redirect_to admin_questions_path
    else
      flash[:danger] = t "controller.question.create_error"
      render :new
    end
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = t "controller.question.update_success"
      redirect_to admin_questions_path
    else
      flash[:danger] = t "controller.question.update_error"
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t "controller.question.delete_success"
    else
      flash[:danger] = t "controller.question.delete_error"
    end
    redirect_to admin_questions_path
  end

  private
  def question_params
    params.require(:question).permit :content, :question_type, :subject_id,
      :state,answers_attributes: [:id, :content, :is_correct, :_destroy]
  end

  def load_question
    @question = Question.find_by id: params[:id]
  end

  def load_subjects
    @subjects = Subject.all
  end
end
