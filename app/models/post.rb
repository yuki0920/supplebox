class Post < ApplicationRecord
  belongs_to :user
  belongs_to :product
  mount_uploader :picture, PictureUploader
end
