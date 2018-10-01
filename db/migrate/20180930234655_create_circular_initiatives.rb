class CreateCircularInitiatives < ActiveRecord::Migration[5.1]
  def change
    create_table :circular_initiatives do |t|
      t.string :Name_of_the_initiative
      t.string :Initiative_description
      t.string :Leading_organization
      t.string :Organization_sector
      t.string :Organization_type
      t.string :Website
      t.string :Primary_strategy
      t.string :Region
      t.string :Country
      t.string :City

      t.timestamps
    end
  end
end
