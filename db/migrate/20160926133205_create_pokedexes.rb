class CreatePokedexes < ActiveRecord::Migration[5.0]
  def change
    create_table :pokedexes do |t|
      t.integer :user_id, null: false
      t.integer :pokemon_id, null: false
      t.integer :cp, null: false
      t.integer :hp, null: false
      t.belongs_to :move, null: false
      t.belongs_to :special_move, null: false

    end
  end
end
