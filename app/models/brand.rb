class Brand < ApplicationRecord
  
  # アイテムとの関連付け ##brandが削除されたら紐づいたproductのbrand_idはnil
  has_many :products, dependent: :nullify

  # ページネーションの表示件数追加
  paginates_per 9
  
  # 検証
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  
  # 画像アップロード用
  mount_uploader :picture, PictureUploader
  
end
