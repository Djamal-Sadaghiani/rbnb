class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :postcode, :string
    add_column :users, :country, :string
    add_column :users, :avatar, :string, default: "https://cdn.iconscout.com/public/images/icon/free/png-512/avatar-user-teacher-312a499a08079a12-512x512.png"
    add_column :users, :date_of_birth, :date
    add_column :users, :phone_number, :string
  end
end
