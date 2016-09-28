class DropTableMoves < ActiveRecord::Migration[5.0]
  def up
    drop_table :moves
  end

  def down
    create_table :moves do |t|
      t.string :move_name, null: false
    end
  end
end
