class Result < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :question
end
