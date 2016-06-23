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
  
  def get_point lesson_id
    @point = Answer.is_correct_answers(lesson_id).count
    @number_question = Lesson.find_by(id: lesson_id).subject.number_question
    return @point, @number_question
  end

  private
  def get_questions
    self.questions << self.subject.questions.order("RANDOM()")
      .limit(self.subject.number_question)
  end
end
