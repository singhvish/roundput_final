class CircularInitiative < ApplicationRecord
	searchkick
	has_many :reviews
	has_reputation :votes, source: :user, aggregated_by: :sum

	mount_uploader :video, VideoUploader

	validates :Name_of_the_initiative, :Leading_organization, presence: true

	def self.import(file)
  		CSV.foreach(file.path, headers: true) do |row|
  			CircularInitiative.create! row.to_hash
  		end
	end
	
end
