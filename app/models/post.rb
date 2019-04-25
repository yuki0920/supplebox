class Post < ApplicationRecord
  # ユーザーとの関連付け
  belongs_to :user
  
  # 商品との関連付け
  belongs_to :product

  # 画像アップローダーの指定
  mount_uploader :picture, PictureUploader
  
  validates :title, presence: true
  validates :rate, presence: true, numericality: true
  validates :content, presence: true
  
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
