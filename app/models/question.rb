class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  has_many :answers
  has_many :results
end
