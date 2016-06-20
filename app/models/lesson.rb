class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  has_many :results
  has_many :questions, through: :results

  enum status: [:start, :testing, :unchecked, :checked]

  after_create :create_lessons

  accepts_nested_attributes_for :results

  def change_status_lesson
    if self.start?
      self.status = :testing
      self.save
    end
  end

  private
  def create_lessons
    self.questions << self.subject.questions.order("RANDOM()")
      .limit(self.subject.number_question)
  end
end
