class Review < ApplicationRecord
	belongs_to :user
	belongs_to :circular_initiative
end
