class User < ApplicationRecord
  
  # ユーザー登録用
  has_secure_password

  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :nickname, presence: true, length: { maximum: 50 }
  has_secure_password
  
  #口コミ投稿との関連付け
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
  
  #　フォロー機能追加用中間テーブル
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  # フォロー登録
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  # フォロー削除
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  
  # フォロー判定
  def following?(other_user)
    self.followings.include?(other_user)
  end  
end
