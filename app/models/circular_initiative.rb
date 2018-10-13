class CircularInitiative < ApplicationRecord
	searchkick
	belongs_to :sector

	validates :Name_of_the_initiative, :Leading_organization, presence: true
end
