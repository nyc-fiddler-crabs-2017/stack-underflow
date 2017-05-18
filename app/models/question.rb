class Question < ActiveRecord::Base
  validates :title, :body, :author_id, presence: true

  belongs_to :author, class_name: "User"
  has_one :best_answer, class_name: "Answer"
  has_many :answers
  has_many :responders, through: :answers, source: :user
end
