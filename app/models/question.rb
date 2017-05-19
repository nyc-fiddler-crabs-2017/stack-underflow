class Question < ActiveRecord::Base
  validates :title, :body, :author_id, presence: true

  belongs_to :author, class_name: "User"
  # has_one :best_answer, class_name: "Answer"
  has_many :answers
  has_many :responders, through: :answers, source: :user

  def best_answer
    Answer.find_by_id(best_answer_id)
  end

  # def best_answer=(answer)
  #   best_answer_id = answer.id
  # end

end
