class User < ActiveRecord::Base
    has_many :comments
    has_many :submissions
    has_many :votes

end
