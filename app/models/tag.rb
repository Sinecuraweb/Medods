class Tag < ApplicationRecord
  #start tag
  has_many :taggings
  #has_many :boards, through: :taggings
  has_and_belongs_to_many :boards

  def self.counts
    Tag.select("name, count(taggings.tag_id) as count").joins(:taggings).group("name, taggings.tag_id")
    #Tag.select ("tags.id, tags.name, count (taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end
end
