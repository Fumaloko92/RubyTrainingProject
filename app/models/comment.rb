class Comment < ActiveRecord::Base
  def user_params
    params.require(:title, :content).permit(:title,:content)
  end
  
  belongs_to :post
  belongs_to :user
  
  validates :title, :content, :presence => true
  validates :title, :length => {:minimum => 2}
end

