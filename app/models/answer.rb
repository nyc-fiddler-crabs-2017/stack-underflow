class Answer < ActiveRecord::Base
  validates :body, :user_id, :question_id, presence: true

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable

  def is_best_answer?
    question.best_answer == self
  end

end
