class Move
  has_many :pokedexes

  validates :move_name, presence: true
end
