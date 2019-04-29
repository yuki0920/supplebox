class Contact < ApplicationRecord
  # ユーザーとの関連付け
  belongs_to :user, optional: true
  
  # バリデーション
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 50 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
end
