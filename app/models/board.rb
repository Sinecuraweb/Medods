class Board < ApplicationRecord
	mount_uploader :picture, PictureUploader
	has_many :comments

	belongs_to :user


	#start search
	def self.search(search)
		if search
			where(["title LIKE ?", "%#{search}%"])

		end
	end

	#start tag
	has_many :taggings
	has_many :tags, through: :taggings

	def all_tags
		self.tags.map(&:name).join(', ')
	end

	def all_tags=(names)
		#Добавляем теги к посту
		self.tags = names.split(',').map do |name|
			#Ищеи тег по имени
			Tag.where(name: name.strip).first_or_create
		end
	end
end
