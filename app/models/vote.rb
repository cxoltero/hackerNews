class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission
  belongs_to :comment
end
