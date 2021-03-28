class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true, length: { maximum: 6 }

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'Password Include both letters and numbers'
         validates :birth_day, presence: true
         validates :name_lastname_kana,format:{ with: /\A[ァ-ヶー－]+\z/, message:'Last name Full-width characters'}
         validates :name_firstname_kana, format:{ with: /\A[ァ-ヶー－]+\z/, message:'First name Full-width characters'}
         validates :name_lastname, format:{ with: /\A[ぁ-んァ-ン一-龥]/, message:"Last name can't be blank"}
         validates :name_firstname, format:{ with: /\A[ぁ-んァ-ン一-龥]/,message:"First name can't be blank"}
end
