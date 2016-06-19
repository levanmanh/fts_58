class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  has_many :results
  has_many :questions, through: :results

  enum status: [:open, :testing, :saved, :checking, :closed]

  accepts_nested_attributes_for :results

  after_create :create_lessons

  private
  def create_lessons
    self.questions << self.subject.questions.order("RANDOM()")
      .limit(self.subject.number_question)
  end
end
