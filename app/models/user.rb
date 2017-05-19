class User < ActiveRecord::Base
  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_many :answers
  has_many :created_questions, class_name: "Question", foreign_key: :author_id
  has_many :answered_questions, through: :answers, source: :question
  has_many :comments
end
