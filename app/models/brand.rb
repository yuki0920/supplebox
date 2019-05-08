class Brand < ApplicationRecord
  
  # アイテムとの関連付け
  has_many :products
  validates :name, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  
end
