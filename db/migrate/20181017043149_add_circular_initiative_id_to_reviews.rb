class AddCircularInitiativeIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :circular_initiative_id, :integer
  end
end
