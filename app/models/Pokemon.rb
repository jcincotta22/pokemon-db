require "csv"
require "pry"

class Pokemon < ActiveRecord::Base
  has_many :pokedexes
  has_many :users, through: :pokedexes

  validates :name, presence: true
  validates :type_1, presence: true
  validates :cp, numericality: true, presence: true
  validates :hp, numericality: true, presence: true
  validates :move_1, presence: true
  validates :move_2, presence: true

  POKEMON_COLLECTION = []
  POKEMON_NAMES_COLLECTION = []

  CSV.foreach('./db/pokedex.csv', headers: true, header_converters: :symbol) do |row|
    POKEMON_COLLECTION << row.to_h
    POKEMON_NAMES_COLLECTION << row[:pokemon]
  end

end
