class AddAddressToCircularInitiatives < ActiveRecord::Migration[5.1]
  def change
    add_column :circular_initiatives, :address, :string
  end
end
