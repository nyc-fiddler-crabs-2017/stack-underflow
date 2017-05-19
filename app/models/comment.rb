class Comment < ActiveRecord::Base
  validates :body, :commentable_type, :commentable_id, :user_id, presence: true

  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
