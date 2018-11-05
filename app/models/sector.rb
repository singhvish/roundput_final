class Sector < ApplicationRecord
	searchkick inheritance: true
	has_many :CircularInitiatives
end
