class AddSectorIdToCircularInitiatives < ActiveRecord::Migration[5.1]
  def change
    add_column :circular_initiatives, :sector_id, :integer
  end
end
