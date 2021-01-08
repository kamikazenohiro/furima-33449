class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,           presence: true
       # validates :encrypted_password, 半角英数字混合での入力が必須であること
         validates :last_name,          presence: true #, 全角（漢字・ひらがな・カタカナ）での入力が必須であること
         validates :first_name,         presence: true #, 全角（漢字・ひらがな・カタカナ）での入力が必須であること
         validates :last_kana,          presence: true #, 全角（カタカナ）での入力が必須であること
         validates :first_kana,         presence: true #, 全角（カタカナ）での入力が必須であること
         validates :date,               presence: true
end
