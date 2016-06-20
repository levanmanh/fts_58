class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  has_many :results
  has_many :questions, through: :results

  enum status: [:start, :testing, :checking, :unchecked]

  before_create :add_lessons

  private
  def add_lessons
    self.questions << self.subject.questions.order("RANDOM()")
      .limit(self.subject.number_question)
  end
end
