class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,           presence: true
      
      with_options presence: true do
        validates :password,           format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters." }
        validates :last_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
        validates :first_name,         format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
        validates :last_kana,          format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
        validates :first_kana,         format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
      end
        # validates :last_name,          presence: true #, 全角（漢字・ひらがな・カタカナ）での入力が必須であること
        # validates :first_name,         presence: true #, 全角（漢字・ひらがな・カタカナ）での入力が必須であること
        # validates :last_kana,          presence: true #, 全角（カタカナ）での入力が必須であること
        # validates :first_kana,         presence: true #, 全角（カタカナ）での入力が必須であること
         validates :date,               presence: true
end
