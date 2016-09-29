class ChangeTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :table_pokedexes, :pokedexes
  end
end
