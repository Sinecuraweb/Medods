class Tag < ApplicationRecord
	#start tag
	has_many :taggings
	has_many :boards, through: :taggings
end
