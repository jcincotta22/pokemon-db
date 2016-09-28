class CreateSpecialMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :special_moves do |t|
      t.string :move_name, null: false
    end
  end
end
