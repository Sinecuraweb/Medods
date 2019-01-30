class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # Confirmable, -подтверждение по email
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, 
          :registerable,
          :recoverable,  #Восстановить пароль
          :rememberable, #Хранит сессию и сохраняет куки
          :validatable
  has_many :boards

  validates :name, presence: true # NOT NULL !
  #mount_uploader :avatar, PictureUploader  Сменили на paperclip
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
