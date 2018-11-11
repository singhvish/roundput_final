class AddNewColumnsToCircularInitiatives < ActiveRecord::Migration[5.1]
  def change
    add_column :circular_initiatives, :partners, :text
    add_column :circular_initiatives, :problem, :text
    add_column :circular_initiatives, :awards, :text
    add_column :circular_initiatives, :funding, :string
    add_column :circular_initiatives, :linkedin, :string
    add_column :circular_initiatives, :twitter, :string
    add_column :circular_initiatives, :facebook, :string
    add_column :circular_initiatives, :instagram, :string
    add_column :circular_initiatives, :email, :string
  end
end
