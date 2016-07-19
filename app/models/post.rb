class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :games
  
  mount_uploader :avatar, AvatarUploader
  
  validates :title, :content, :user_id, :presence => true
  validates :title, :length => {:minimum => 2}
  validates :title, :uniqueness => { :message => "already taken" }
end

