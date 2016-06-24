class QuestionsController < ApplicationController
  before_action :logged_in_user
  before_action :load_subjects, except: [:index]
  before_action :load_question, except: [:index, :new, :create]

  def index
    @questions = Question.order(created_at: :desc).of_user current_user.id
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
      redirect_to questions_path
    else
      flash[:danger] = t "controller.question.error_question"
      render :new
    end
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = t "controller.question.update_success"
      redirect_to questions_path
    else
      flash[:danger] = t "controller.question.update_error"
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t "controller.question.delete_success"
      redirect_to questions_path
    else
      flash[:notice] = t "controller.question.delete_error"
      redirect_to :back
    end
  end

  private
  def question_params
    params.require(:question).permit :user_id, :content, :question_type, :subject_id,
      :state, answers_attributes: [:id, :content, :is_correct, :_destroy]
  end

  def load_question
    @question = Question.find params[:id]
  end

  def load_subjects
    @subjects = Subject.all
  end
end
