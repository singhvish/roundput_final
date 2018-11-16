class CircularInitiative < ApplicationRecord
	searchkick
	belongs_to :sector
	has_many :reviews

	mount_uploader :video, VideoUploader

	validates :Name_of_the_initiative, :Leading_organization, presence: true
	validates :website, format: {with: /\Ahttps?:\/\/.*\z/,
		message: "must start with http:// or https://"}
end
