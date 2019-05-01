class Contact < ApplicationRecord
  # ユーザーとの関連付け
  belongs_to :user, optional: true
  
  # バリデーション
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
end
