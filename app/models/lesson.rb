class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  has_many :results
  has_many :questions, through: :results

  accepts_nested_attributes_for :results

  after_create :get_questions

  enum status: [:start, :testing, :unchecked, :checked]

  def change_status_lesson
    if self.start?
      self.status = :testing
      self.save
    end
  end

  private
  def get_questions
    self.questions << self.subject.questions.order("RANDOM()")
      .limit(self.subject.number_question)
  end
end
