class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates :title, :content, :user_id, :post_id, :presence => true
  validates :title, :length => {:minimum => 2}
end

