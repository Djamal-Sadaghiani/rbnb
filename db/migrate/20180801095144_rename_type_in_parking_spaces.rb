class RenameTypeInParkingSpaces < ActiveRecord::Migration[5.2]
  def change
    rename_column :parking_spaces, :type, :category
  end
end
