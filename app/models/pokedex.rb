class Pokedex < ActiveRecord::Base
  validates :user_id, numericality: true, presence: true
  validates :pokemon_id, numericality: true, presence: true

  belongs_to :user
  belongs_to :pokemon
end
