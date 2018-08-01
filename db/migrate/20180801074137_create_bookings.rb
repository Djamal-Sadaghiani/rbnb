class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :parking_space, foreign_key: true
      t.references :car, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
