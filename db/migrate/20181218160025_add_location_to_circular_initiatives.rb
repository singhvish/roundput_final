class AddLocationToCircularInitiatives < ActiveRecord::Migration[5.2]
  def change
    add_column :circular_initiatives, :location, :string
  end
end
