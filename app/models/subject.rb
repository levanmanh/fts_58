class Subject < ActiveRecord::Base
  has_many :questions
  has_many :lessons

  validates :name, presence: true, length: {maximum: 50}
  validates :number_question, presence: true,
    numericality:{only_integer: true, greater_than: 0}
end
