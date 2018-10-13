class ChangeInitiativeDescriptionFromStringToText < ActiveRecord::Migration[5.1]
  def change
  	change_column :circular_initiatives, :Initiative_description, :text
  end
end
