# Board Class
class Board < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :comments
  #has_many :taggings
  has_and_belongs_to_many :tags
  belongs_to :user
  # start search
  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"])
    else
      all
    end
  end
  # start tag
  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    # Добавляем теги к посту
    self.tags = names.split(',').map do |name|
    # Tag for name
      Tag.where(name: name.strip).first_or_create!
    end
  end
end