class AddAddressFieldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string
    add_column :users, :number, :string
    add_column :users, :complement, :string
    add_column :users, :neighborhood, :string
  end
end
