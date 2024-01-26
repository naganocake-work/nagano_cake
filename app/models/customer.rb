class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :last_name, :first_name, format: { with: /\A[\p{Han}\p{Katakana}\p{Hiragana}ー]+\z/, message: "は文字のみで入力してください" }
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "はカタカナと長音記号のみで入力してください" }
    validates :postal_code, format: { with: /\A\d{7}\z/, message: "はハイフンなしの7桁の数字で入力してください" }
    validates :telephone_number, format: { with: /\A\d+\z/, message: "は半角数字のみで入力してください" }

end
