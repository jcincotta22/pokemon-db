class DropTableSpecialMoves < ActiveRecord::Migration[5.0]
  def up
    drop_table :special_moves
  end

  def down
    create_table :special_moves do |t|
      t.string :move_name, null: false
    end
  end
end
