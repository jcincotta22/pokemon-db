class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.string :move_name, null: false
    end
  end
end
