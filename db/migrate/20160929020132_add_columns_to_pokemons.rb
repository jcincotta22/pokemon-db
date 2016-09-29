class AddColumnsToPokemons < ActiveRecord::Migration[5.0]
  def up
    drop_table :pokemons
  end

  def down
    create_table :pokemons do |t|
      t.string :name, null: false
      t.string :type_1, null: false
      t.string :type_2, null: false
    end
  end
end
