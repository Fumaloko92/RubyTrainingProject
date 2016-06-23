class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  validates :title, :content, :user_id, :presence => true
  validates :title, :length => {:minimum => 2}
  validates :title, :uniqueness => { :message => "already taken" }
end

