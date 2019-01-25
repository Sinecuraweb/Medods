class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, -подтверждение по email
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
  		 :registerable,
         :recoverable,  #Восстановить пароль
         :rememberable, #Хранит сессию и сохраняет куки
         :validatable
   has_many :boards

   validates :name, presence: true # NOT NULL !
end


