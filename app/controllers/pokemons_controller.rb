class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def new
    @pokemon = Pokemon.new
    @pokemon_names_collection = Pokemon::POKEMON_NAMES_COLLECTION
    @pokemon_names_collection.sort!
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @user = current_user
    @pokemon_collection = Pokemon::POKEMON_COLLECTION

    @pokemon_collection.each do |pokemon|
      if pokemon[:pokemon] == pokemon_params[:name]
        @pokemon.type_1 = pokemon[:type_1]
        unless pokemon[:type_2].nil?
          @pokemon.type_2 = pokemon[:type_2]
        end
      end

    end
    if @pokemon.save
      @pokedex = Pokedex.create(user: @user, pokemon: @pokemon)
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
    params.require(:pokemon).permit(:name, :move_1, :move_2, :cp, :hp)
  end

end
