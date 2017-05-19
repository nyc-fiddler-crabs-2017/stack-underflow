class Comment < ActiveRecord::Base
  validates :body, :commentable_type, :commentable_id, :user_id, presence: true
  include Voteable
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable
end
