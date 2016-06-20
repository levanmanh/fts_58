class Result < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :question
  belongs_to :answer

  scope :correct_answer, -> {joins(:option).where options: {is_correct: true}}
end
