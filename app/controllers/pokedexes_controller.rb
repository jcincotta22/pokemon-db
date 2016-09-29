class PokedexesController < ApplicationController
  def new
    @pokedex = Pokedex.new
  end
end
