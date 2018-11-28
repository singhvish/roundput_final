class AddOrganizationDescriptionToCircularInitiative < ActiveRecord::Migration[5.2]
  def change
    add_column :circular_initiatives, :Organization_description, :text
  end
end
