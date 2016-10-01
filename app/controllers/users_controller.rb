class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @pokemons = @user.pokemons.order(cp: :desc)
    @top_5 = @pokemons.first(5)
  end
end
