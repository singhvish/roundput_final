class AddVideoToCircularInitiatives < ActiveRecord::Migration[5.1]
  def change
    add_column :circular_initiatives, :video, :string
  end
end
