class User < ApplicationRecord
  has_secure_password

  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :posts
  
  #お気に入り機能追加用中間テーブル追加
  has_many :likes
  has_many :products, through: :likes
  
  # お気に入り追加
  def like(product)
    likes.find_or_create_by(product_id: product.id)
  end
  
  # お気に入り削除
  def unlike(product)
    like = likes.find_by(product_id: product.id)
    like.destroy if like
  end
  
  # お気に入り登録判定
  def like?(product)
    self.products.include?(product)
  end
end
