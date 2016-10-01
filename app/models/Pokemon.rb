require "csv"

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

  def weakness(pokemon_obj)
    type_arr = []
      if pokemon_obj.type_1 == "Bug" || pokemon_obj.type_2 == "Bug"
        type_arr = ["Fire", "Flying", "Rock"]
      elsif pokemon_obj.type_1 == "Dark" || pokemon_obj.type_2 == "Dark"
        type_arr = ["Bug", "Fairy", "Fight"]
      elsif pokemon_obj.type_1 == "Dragon" || pokemon_obj.type_2 == "Dragon"
        type_arr = ["Dragon", "Fairy", "Ice"]
      elsif pokemon_obj.type_1 == "Electric" || pokemon_obj.type_2 == "Electric"
        type_arr = ["Ground"]
      elsif pokemon_obj.type_1 == "Fairy" || pokemon_obj.type_2 == "Fairy"
        type_arr = ["Poison", "Steel"]
      elsif pokemon_obj.type_1 == "Fighting" || pokemon_obj.type_2 == "Fighting"
        type_arr = ["Fairy", "Flying", "Psychic"]
      elsif pokemon_obj.type_1 == "Fire" || pokemon_obj.type_2 == "Fire"
        type_arr = ["Ground", "Rock", "Water"]
      elsif pokemon_obj.type_1 == "Flying" || pokemon_obj.type_2 == "Flying"
        type_arr = ["Electic", "Ice", "Rock"]
      elsif pokemon_obj.type_1 == "Ghost" || pokemon_obj.type_2 == "Ghost"
        type_arr = ["Dark", "Ghost"]
      elsif pokemon_obj.type_1 == "Grass" || pokemon_obj.type_2 == "Grass"
        type_arr = ["Bug", "Fire", "Flying", "Ice", "Poison"]
      elsif pokemon_obj.type_1 == "Ground" || pokemon_obj.type_2 == "Ground"
        type_arr = ["Grass", "Ice", "Water"]
      elsif pokemon_obj.type_1 == "Ice" || pokemon_obj.type_2 == "Ice"
        type_arr = ["Fighting", "Fire", "Rock", "Steel"]
      elsif pokemon_obj.type_1 == "Normal" || pokemon_obj.type_2 == "Normal"
        type_arr = ["Fighting"]
      elsif pokemon_obj.type_1 == "Poison" || pokemon_obj.type_2 == "Poison"
        type_arr = ["Ground", "Psychic"]
      elsif pokemon_obj.type_1 == "Psychic" || pokemon_obj.type_2 == "Psychic"
        type_arr = ["Bug", "Dark", "Ghost"]
      elsif pokemon_obj.type_1 == "Rock" || pokemon_obj.type_2 == "Rock"
        type_arr = ["Fight", "Grass", "Ground", "Steel", "Water"]
      elsif pokemon_obj.type_1 == "Steel" || pokemon_obj.type_2 == "Steel"
        type_arr = ["Fight", "Fire", "Ground"]
      else
        type_arr = ["Electric", "Grass"]
      end
    return type_arr
  end

end
