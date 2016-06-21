class Post < ActiveRecord::Base
  def user_params
    params.require(:title, :content).permit(:title,:content)
  end
  
  belongs_to :user
  has_many :comments
  
  validates :title, :content, :presence => true
  validates :title, :length => {:minimum => 2}
  validates :title, :uniqueness => { :message => "already taken" }
  
end

