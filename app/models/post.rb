# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :title, presence: true, length: {maximum: 50}
  validates :rate, presence: true
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }
  validates :content, length: {maximum: 300}
  validates :user_id, uniqueness: {scope: [:product_id]}
  validate :picture_size

  paginates_per 10
  mount_uploader :picture, PictureUploader

  private

  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    errors.add(:picture, 'ファイルサイズを5MBより小さくしてください') if picture.size > 5.megabytes
  end
end
