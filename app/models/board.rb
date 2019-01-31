# Board Class
class Board < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :comments
  # Has_belong_to_many
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user
  #start search
  def self.search(search)
    if search
      where(["title LIKE ?", "%#{search}%"])
    else
      all
    end
  end

  #start tag
  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    #Добавляем теги к посту
    self.tags = names.split(',').map do |name|
    #Ищеи тег по имени
      Tag.where(name: name.strip).first_or_create!
    end
  end
end