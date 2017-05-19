class User < ActiveRecord::Base
  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_many :votes
  has_many :answers
  has_many :created_questions, class_name: "Question", foreign_key: :author_id
  has_many :answered_questions, through: :answers, source: :question
  has_many :comments
  has_many :commented_questions, through: :comments, source: :commentable, source_type: "Question"
  has_many :commented_answers, through: :comments, source: :commentable, source_type: "Answer"
  has_many :voted_questions, through: :votes, source: :voteable, source_type: "Question"
  has_many :voted_answers, through: :votes, source: :voteable, source_type: "Answer"
  has_many :voted_comments, through: :votes, source: :voteable, source_type: "Comment"

end
