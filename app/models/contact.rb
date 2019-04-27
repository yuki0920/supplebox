class Contact < ApplicationRecord
  # ユーザーとの関連付け
  belongs_to :user
  
  # バリデーション
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
end
