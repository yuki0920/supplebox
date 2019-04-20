class Post < ApplicationRecord
  belongs_to :user
  belongs_to :product
  mount_uploader :picture, PictureUploader
  validate  :picture_size

  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "ファイルサイズを5MBより小さくしてください")
      end
    end  
end
