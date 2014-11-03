class Submission < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes

  def self.top20
     Post.all.limit(20)
  end

end
