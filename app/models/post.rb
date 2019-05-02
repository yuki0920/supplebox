class Post < ApplicationRecord
  # ユーザーとの関連付け
  belongs_to :user
  
  # 商品との関連付け
  belongs_to :product

  # 画像アップローダーの指定
  mount_uploader :picture, PictureUploader
  
  validates :title, presence: true
  validates :rate, presence: true
  validates :rate, numericality: { 
    only_integer: true, 
    less_than_or_equal_to: 5, 
    greater_than_or_equal_to: 1 
  }
  validates :content, presence: true
  validates :user_id, uniqueness: { scope: [:product_id] }
  
  # 画像サイズ
  validate :picture_size

  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "ファイルサイズを5MBより小さくしてください")
      end
    end  
end
