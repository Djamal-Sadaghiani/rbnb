class CreateParkingSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_spaces do |t|
      t.float :size
      t.string :address
      t.string :city
      t.string :postcode
      t.string :country
      t.float :latitude
      t.float :longitude
      t.string :type
      t.string :availability
      t.integer :price_per_hour
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
