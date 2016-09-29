class Pokedex < ActiveRecord::Base
  validates :user_id, numericalitiy: true, presence: true
  validates :pokemon_id, numericalitiy: true, presence: true

  belongs_to :user
  belongs_to :pokemon  
end
