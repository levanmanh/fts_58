class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  has_many :answers
  has_many :results

  accepts_nested_attributes_for :answers,
    reject_if: proc {|attributes| attributes[:content].blank?},
    allow_destroy: true

  enum question_type: [:single, :multiple]  

  def check_answer_user_is_correct? result
    result.answer_id.in? answers.where(is_correct: true).ids
  end
end
