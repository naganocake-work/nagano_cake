class Address < ApplicationRecord

  belongs_to :customer
  
  validates :postal_code, format: { with: /\A\d{7}\z/, message: "はハイフンなしの7桁の数字で入力してください" }
  validates :addressee_name, presence: true
  validates :address_area, presence: true
  
end
