class Vote < ActiveRecord::Base
  validates :value, :voteable_id, :voteable_type, :user_id, presence: true
  validates :user_id, uniqueness: { scope: [:voteable_id, :voteable_type] }

  belongs_to :voteable, polymorphic: true
  belongs_to :user


end
