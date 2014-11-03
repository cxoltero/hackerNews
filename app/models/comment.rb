class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission
  belongs_to :comment
  has_many :comments
  has_many :votes
end
