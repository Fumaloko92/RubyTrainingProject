class Game < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :genres
  has_many :platforms
  
  validates :name, :presence => true
end