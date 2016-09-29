class CreateTablePokedexes < ActiveRecord::Migration[5.0]
  def change
    create_table :table_pokedexes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :pokemon, null: false
    end
  end
end
