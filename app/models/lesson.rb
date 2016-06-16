class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  has_many :results
end
