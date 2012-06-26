class PostsComment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :comment
end
