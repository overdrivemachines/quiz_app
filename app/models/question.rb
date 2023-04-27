class Question < ApplicationRecord
  belongs_to :quiz
  has_one_attached :image

  validates :correct_answer, inclusion: { in: 1..4 }
end
