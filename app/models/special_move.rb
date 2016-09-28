class Special_move
  has_many :pokedex
  validates :move_name, presence: true
end
