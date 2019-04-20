class Product < ApplicationRecord
  validates :asin, uniqueness: true
  has_many :posts

  #お気に入り機能追加用中間テーブル追加
  has_many :likes, foreign_key: 'product_id', dependent: :destroy
  has_many :users, through: :likes  
end
