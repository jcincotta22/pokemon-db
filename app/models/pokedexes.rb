class Pokedex < ActiveRecord::Base
  validates :user_id, numericalitiy: true, presence: true
  validates :pokemon_id, numericalitiy: true, presence: true
  validates :move_id, numericalitiy: true, presence: true
  validates :special_move_id, numericalitiy: true, presence: true
  validates :cp, numericalitiy: true, presence: true
  validates :hp, numericalitiy: true, presence: true

  belongs_to :user
  belongs_to :pokemon
  belongs_to :move
  belongs_to :special_move
end
