class CreateTablePokemons2 < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.string :type_1, null: false
      t.string :type_2, null: false
      t.integer :cp, null: false
      t.integer :hp, null: false
      t.string :move_1, null: false
      t.string :move_2, null: false
    end
  end
end
