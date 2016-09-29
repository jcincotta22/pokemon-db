class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def new
    @pokemon = Pokemon.new
    @pokemon_names_collection = Pokemon::POKEMON_NAMES_COLLECTION
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @user = current_user
    @pokemon_collection = Pokemon::POKEMON_COLLECTION
    if @pokemon.save
      flash[:notice] ='Pokemon was successfully saved to your Pokedex.'
      redirect_to new_pokemon_path
    else
      @errors = @pokemon.errors.full_messages.join(', ')
      flash[:notice] = @errors
      redirect_to new_pokemon_path
    end
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :type_1, :type_2, :move_1, :move_2, :cp, :hp)
  end

end
