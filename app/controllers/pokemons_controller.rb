class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    @users = User.all
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
    if @user
      if @pokemon.save
        @pokedex = Pokedex.create(user: @user, pokemon: @pokemon)
        flash[:notice] ='Pokemon was successfully saved to your Pokedex.'
        redirect_to new_pokemon_path
      else
        @errors = @pokemon.errors.full_messages.join(', ')
        flash[:notice] = @errors
        redirect_to new_pokemon_path
      end
    else
      flash[:notice] = "Must be signed in"
      redirect_to new_pokemon_path
    end
  end

  def fight
    @fight = Pokemon.new
    @pokemon_names_collection = Pokemon::POKEMON_NAMES_COLLECTION
    @pokemon_names_collection.sort!
  end

  def fighting
    pokemon_to_use = []
    poke_weakness = []
    pokemon_names = []
    @user = current_user
    @pokemon = Pokemon.new(params[:name])
    @pokemon_collection = Pokemon::POKEMON_COLLECTION
    @pokedex = @user.pokemons

    @pokemon_collection.each do |pokemon|
      if pokemon[:pokemon] == pokemon_params[:name]
        @pokemon.type_1 = pokemon[:type_1]
        unless pokemon[:type_2].nil?
          @pokemon.type_2 = pokemon[:type_2]
        end
      end
    end
    poke_weakness = @pokemon.weakness(@pokemon)


        poke_weakness.each do |poke|
          pokemon_to_use << @user.pokemons.where(type_1: poke)
          pokemon_to_use << @user.pokemons.where(type_2: poke)
        end
        pokemon_to_use[0].each do |pokemon|
          pokemon_names << pokemon.name
        end
    if pokemon_names.empty?
      flash[:alert] = "You do not have any Pokemon in your collection that are strong against this character"
    else
      flash[:alert] = "Use your: #{pokemon_names.join(', ')}"
    end
    redirect_to fight_path

  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :move_1, :move_2, :cp, :hp)
  end

end
