class CircularInitiative < ApplicationRecord
	searchkick
	has_many :reviews
	has_reputation :votes, source: :user, aggregated_by: :sum

	mount_uploader :video, VideoUploader

	validates :Name_of_the_initiative, :Leading_organization, presence: true
	
end
