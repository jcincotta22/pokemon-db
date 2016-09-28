class Pokemon < ActiveRecord::Base
  has_many :pokedexes
  has_many :users, through: :pokedexes

  validates :name, presence: true;
  validates :type_1, presence: true;
end
