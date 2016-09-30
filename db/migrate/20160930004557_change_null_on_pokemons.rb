class ChangeNullOnPokemons < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:pokemons, :type_2, true)
  end
end
