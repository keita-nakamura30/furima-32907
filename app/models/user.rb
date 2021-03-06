class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence:true do
         validates :birth_day 
         validates :nickname,length: { maximum: 6 }
       


         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'Password Include both letters and numbers'
         
         
         with_options format:{ with: /\A[ァ-ヶー－]+\z/,message:'Full width katakana characters'} do
        validates :name_lastname_kana
        validates :name_firstname_kana
        end

        with_options format:{ with: /\A[ぁ-んァ-ン一-龥]/,message:'Full width characters'} do
        validates :name_lastname
        validates :name_firstname
      end
    end
  end
