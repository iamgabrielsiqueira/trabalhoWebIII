class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.string :description
      t.boolean :status
      t.references :room_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
