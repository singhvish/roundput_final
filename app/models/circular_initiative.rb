class CircularInitiative < ApplicationRecord
	searchkick
	belongs_to :sector
	has_many :reviews

	mount_uploader :video, VideoUploader

	validates :Name_of_the_initiative, :Leading_organization, presence: true
end
