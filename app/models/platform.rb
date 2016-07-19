class Platform < ActiveRecord::Base
  belongs_to :game
  
  validates :name, :presence => true
end
  