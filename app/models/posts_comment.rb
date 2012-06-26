class PostsComment < ActiveRecord::Base
  belongs_to :posts
  attr_accessible :comment
end
