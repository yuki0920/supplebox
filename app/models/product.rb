class Product < ApplicationRecord
  
  # 商品登録用
  validates :title, presence: true, length: { maximum: 255 }
  ## urlは255字以上のためデータ型が'text
  validates :url, presence: true
  validates :image_url, presence: true, length: { maximum: 255 }
  ## ASINコードで一意に識別
  validates :asin, uniqueness: true, length: { maximum: 255 }
  
  
  # 口コミ投稿との関連付け
  has_many :posts

  #お気に入り機能追加用中間テーブル追加
  has_many :likes, foreign_key: 'product_id', dependent: :destroy
  has_many :users, through: :likes  
end
