class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :last_name, :first_name, presence: true 
    validates :last_name_kana,:first_name_kana, presence: true 
    validates :address, presence: true 
    validates :postal_code, presence: true 
    validates :telephone_number, presence: true 
    

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  def customer_address
    
    '〒' + postal_code + ' ' + address + ' ' + last_name + first_name
    
  end  
  
end
